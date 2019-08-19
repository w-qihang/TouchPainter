//
//  MarkRenderer.m
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/2.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import "MarkRenderer.h"
#import "Mark.h"
#import "Dot.h"
#import "Vertex.h"
#import "Stroke.h"

@implementation MarkRenderer

- (id)initWithCGContext:(CGContextRef)context {
    if(self = [super init]) {
        context_ = context;
        shouldMoveContextToDot_ = YES;
    }
    return self;
}
- (void)visitMark:(id<Mark>)mark {
    
}
- (void)visitDot:(Dot *)dot {
    CGFloat x = [dot location].x;
    CGFloat y = [dot location].y;
    CGFloat frameSize = [dot size];
    CGRect frame = CGRectMake(x-frameSize/2, y-frameSize/2, frameSize, frameSize);
    CGContextSetFillColorWithColor(context_, [dot color].CGColor);
    CGContextFillEllipseInRect(context_, frame);
}
- (void)visitVertex:(Vertex *)vertex {
    CGFloat x = [vertex location].x;
    CGFloat y = [vertex location].y;
    if(shouldMoveContextToDot_) {
        CGContextMoveToPoint(context_, x, y);
        shouldMoveContextToDot_ = NO;
    }
    else {
        CGContextAddLineToPoint(context_, x, y);
    }
}

- (void)visitStroke:(Stroke *)stroke {
    CGContextSetStrokeColorWithColor (context_,[[stroke color] CGColor]);
    CGContextSetLineWidth(context_, [stroke size]);
    CGContextSetLineCap(context_, kCGLineCapRound);
    CGContextStrokePath(context_);
    shouldMoveContextToDot_ = YES;
}

@end
