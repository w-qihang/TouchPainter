//
//  MarkEnumerator.m
//  TouchPainter
//
//  Created by 汪启航 on 2018/6/12.
//  Copyright © 2018年 汪启航. All rights reserved.
//

#import "MarkEnumerator.h"
#import "NSMutableArray+Stack.h"
#import "Mark.h"

@implementation MarkEnumerator

- (NSArray *)allObjects {
    //返回栈中剩余元素
    return [[stack_ reverseObjectEnumerator] allObjects];
}
- (id)nextObject {
    return [stack_ pop];
}

#pragma mark - PrivateMethods
- (id)initWithMark:(id<Mark>)mark {
    if(self = [super init]) {
        stack_ = [[NSMutableArray alloc] initWithCapacity:[mark count]];
        [self traverseAndBuildStackWithMark:mark];
    }
    return self;
}

//使用后序遍历将mark压入栈
- (void)traverseAndBuildStackWithMark:(id<Mark>)mark {
    if(mark == nil) return;
    [stack_ push:mark];
    NSUInteger index = [mark count];
    id <Mark> childMark;
    while ((childMark = [mark childMarkAtIndex: --index])) {
        [self traverseAndBuildStackWithMark:childMark];
    }
}

@end
