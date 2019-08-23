//
//  CanvasViewController.m
//  TouchPainter
//
//  Created by 汪启航 on 2019/7/24.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import "CanvasViewController.h"
#import "CanvasView.h"
#import "Scribble.h"
#import "CanvasViewGenerator.h"
#import "Stroke.h"
#import "Vertex.h"
#import "Dot.h"
#import "DrawScribbleCommand.h"
#import "NSMutableArray+Stack.h"

@interface CanvasViewController ()
{
    @private
    CanvasView *canvasView_; //画布视图
    CGPoint startPoint_;
    UIColor *strokeColor_;
    CGFloat strokeSize_;
    NSMutableArray *undoStack_,*redoStack_; //撤销栈,恢复栈
}
@end

@implementation CanvasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Scribble *scribble = [[Scribble alloc]init];
    [self setScribble:scribble];
}

//从工厂获取canvasView
- (void)loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator {
    [canvasView_ removeFromSuperview];
    canvasView_ = [generator canvasViewWithFrame:CGRectMake(0, 0, 320, 436)];
    [self.view addSubview:canvasView_];
}

- (void)setScribble:(Scribble *)scribble {
    if(_scribble != scribble) {
        _scribble = scribble;
        //观察mark属性的变化
        [_scribble addObserver:self forKeyPath:@"mark" options:NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew context:nil];
    }
}

#pragma mark - 触摸事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    startPoint_ = [[touches anyObject] locationInView:canvasView_];
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint lastPoint = [[touches anyObject] previousLocationInView:canvasView_];
    //
    if(CGPointEqualToPoint(lastPoint, startPoint_)) {
        id <Mark> newStroke = [[Stroke alloc]init];
        [newStroke setColor:strokeColor_];
        [newStroke setSize:strokeSize_];
        //[_scribble addMark:newStroke shouldAddToPreviousMark:NO];
        
        //NSInvocation for drawing
        NSInvocation *drawInvocation = [self drawScribbleInvocation];
        [drawInvocation setArgument:&newStroke atIndex:2];
        
        NSInvocation *undrawInvocation = [self undrawScribbleInvocation];
        [undrawInvocation setArgument:&newStroke atIndex:2];
        
        [self executeInvocation:drawInvocation withUndoInvocation:undrawInvocation];
    }
    //把当前触摸作为顶点添加到临时线条
    CGPoint thisPoint = [[touches anyObject] locationInView:canvasView_];
    Vertex *vertex = [[Vertex alloc] initWithLocation:thisPoint];
    [_scribble addMark:vertex shouldAddToPreviousMark:YES];
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint lastPoint = [[touches anyObject] previousLocationInView:canvasView_];
    CGPoint thisPoint = [[touches anyObject] locationInView:canvasView_];
    //如果触摸从未移动(抬起之前一直在同一处),就向现有stroke组合体添加一个点,否则就把它作为最后一个顶点添加到临时线条
    if(CGPointEqualToPoint(lastPoint, thisPoint)) {
        Dot *singleDot = [[Dot alloc]initWithLocation:thisPoint];
        [singleDot setColor:strokeColor_];
        [singleDot setSize:strokeSize_];
        //[_scribble addMark:singleDot shouldAddToPreviousMark:NO];
        
        NSInvocation *drawInvocation = [self drawScribbleInvocation];
        [drawInvocation setArgument:&singleDot atIndex:2];
        
        NSInvocation *undrawInvocation = [self undrawScribbleInvocation];
        [undrawInvocation setArgument:&singleDot atIndex:2];
        
        // execute the draw command with the undraw command
        [self executeInvocation:drawInvocation withUndoInvocation:undrawInvocation];
    }
    //在此重置起点
    startPoint_ = CGPointZero;
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    startPoint_ = CGPointZero;
}

#pragma mark - Scribble 观察者方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if([object isKindOfClass:[Scribble class]] && [keyPath isEqualToString:@"mark"]) {
        id <Mark> mark = [change objectForKey:NSKeyValueChangeNewKey];
        [canvasView_ setMark:mark];
        [canvasView_ setNeedsDisplay];
    }
}

#pragma mark - 命令 NSInvocation+NSUndoManager
- (NSInvocation *)drawScribbleInvocation {
    NSMethodSignature *executeMethodSignature = [_scribble methodSignatureForSelector:@selector(addMark:shouldAddToPreviousMark:)];
    NSInvocation *drawInvocation = [NSInvocation invocationWithMethodSignature:executeMethodSignature];
    [drawInvocation setTarget:_scribble];
    [drawInvocation setSelector:@selector(addMark:shouldAddToPreviousMark:)];
    BOOL attachToPreviousMark = NO;
    [drawInvocation setArgument:&attachToPreviousMark atIndex:3];
    return drawInvocation;
}

- (NSInvocation *)undrawScribbleInvocation {
    NSMethodSignature *unexecuteMethodSignature = [_scribble methodSignatureForSelector:@selector(removeMark:)];
    NSInvocation *undrawInvocation = [NSInvocation
                                      invocationWithMethodSignature:
                                      unexecuteMethodSignature];
    [undrawInvocation setTarget:_scribble];
    [undrawInvocation setSelector:@selector(removeMark:)];
    return undrawInvocation;
}

- (void)executeInvocation:(NSInvocation *)invocation withUndoInvocation:(NSInvocation *)undoInvocation {
    [invocation retainArguments];
    [[self.undoManager prepareWithInvocationTarget:self] unexecuteInvocation:undoInvocation withRedoInvocation:invocation];
    [invocation invoke];
}
- (void)unexecuteInvocation:(NSInvocation *)invocation withRedoInvocation:(NSInvocation *)redoInvocation {
    [[self.undoManager prepareWithInvocationTarget:self] executeInvocation:redoInvocation withUndoInvocation:invocation];
    [invocation invoke];
}

#pragma mark - Scribble Command 通过撤销栈和恢复栈实现
- (void)executeCommand:(Command *)command prepareForUndo:(BOOL)prepareForUndo {
    if(prepareForUndo) {
        if(!undoStack_) {
            undoStack_ = [[NSMutableArray alloc]init];
        }
        [undoStack_ push:command];
    }
    [command execute];
}
- (void)undoCommand {
    Command *command = [undoStack_ pop];
    [command undo];
    //命令压入恢复栈
    if(!redoStack_) {
        redoStack_ = [[NSMutableArray alloc]init];
    }
    [redoStack_ push:command];
}
- (void)redoCommand {
    Command *command = [redoStack_ pop];
    [command execute];
    [undoStack_ push:command];
}

@end
