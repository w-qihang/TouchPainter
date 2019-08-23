//
//  Scribble.m
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/20.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import "Scribble.h"
#import "Stroke.h"
#import "ScribbleMemento+Friend.h"

@interface Scribble ()
@property (nonatomic,strong) id <Mark> mark;
@end

@implementation Scribble
@synthesize mark=parentMark_;

- (instancetype)init {
    if(self = [super init]) {
        parentMark_ = [[Stroke alloc]init];
    }
    return self;
}

#pragma mark - 管理Mark

- (void)addMark:(id<Mark>)aMark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark {
    //手动调用kvo
    [self willChangeValueForKey:@"mark"];
    //如果yes,就加到前一个mark作为聚合体的一部分,它应该是根节点的最后一个子节点
    if(shouldAddToPreviousMark) {
        [[parentMark_ lastChild] addMark:aMark];
    }
    //否则附加到父节点
    else {
        [parentMark_ addMark:aMark];
        incrementalMark_ = aMark;
    }
    [self didChangeValueForKey:@"mark"];
}

- (void)removeMark:(id<Mark>)aMark {
    //如果aMark是父节点则什么也不做
    if(aMark == parentMark_) {
        return;
    }
    [self willChangeValueForKey:@"mark"];
    [parentMark_ removeMark:aMark];
    if(aMark == incrementalMark_) {
        incrementalMark_ = nil;
    }
    [self didChangeValueForKey:@"mark"];
}

#pragma mark - 备忘录
- (id) initWithMemento:(ScribbleMemento*)aMemento {
    if (self = [super init])
    {
        if ([aMemento hasCompleteSnapshot])
        {
            [self setMark:[aMemento mark]];
        }
        else
        {
            // if the memento contains only
            // incremental mark, then we need to
            // create a parent Stroke object to
            // hold it
            parentMark_ = [[Stroke alloc] init];
            [self attachStateFromMemento:aMemento];
        }
    }
    return self;
}
- (void) attachStateFromMemento:(ScribbleMemento *)memento
{
    // attach any mark from a memento object
    // to the main parent
    [self addMark:[memento mark] shouldAddToPreviousMark:NO];
}
- (ScribbleMemento *) scribbleMementoWithCompleteSnapshot:(BOOL)hasCompleteSnapshot
{
    id <Mark> mementoMark = incrementalMark_;
    
    // if the resulting memento asks
    // for a complete snapshot, then
    // set it with parentMark_
    if (hasCompleteSnapshot)
    {
        mementoMark = parentMark_;
    }
    // but if incrementalMark_
    // is nil then we can't do anything
    // but bail out
    else if (mementoMark == nil)
    {
        return nil;
    }
    
    ScribbleMemento *memento = [[ScribbleMemento alloc]
                                initWithMark:mementoMark];
    [memento setHasCompleteSnapshot:hasCompleteSnapshot];
    
    return memento;
}
- (ScribbleMemento *) scribbleMemento
{
    return [self scribbleMementoWithCompleteSnapshot:YES];
}


+ (Scribble *) scribbleWithMemento:(ScribbleMemento *)aMemento
{
    Scribble *scribble = [[Scribble alloc] initWithMemento:aMemento];
    return scribble;
}


@end
