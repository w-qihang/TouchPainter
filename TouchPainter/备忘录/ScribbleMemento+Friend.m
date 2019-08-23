//
//  ScribbleMemento+Friend.m
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/23.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import "ScribbleMemento+Friend.h"

@implementation ScribbleMemento (Friend)
@dynamic mark,hasCompleteSnapshot;

- (instancetype)initWithMark:(id<Mark>)aMark {
    if(self = [super init]) {
        [self setMark:aMark];
    }
    return self;
}
- (id<Mark>)mark {
    return mark_;
}
- (void)setMark:(id<Mark>)mark {
    mark_ = mark;
}
- (BOOL)hasCompleteSnapshot {
    return hasCompleteSnapshot_;
}
- (void)setHasCompleteSnapshot:(BOOL)hasCompleteSnapshot {
    hasCompleteSnapshot_ = hasCompleteSnapshot;
}

@end
