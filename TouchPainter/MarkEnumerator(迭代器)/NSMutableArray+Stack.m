//
//  NSMutableArray+Stack.m
//  TouchPainter
//
//  Created by 汪启航 on 2018/6/12.
//  Copyright © 2018年 汪启航. All rights reserved.
//

#import "NSMutableArray+Stack.h"

@implementation NSMutableArray (Stack)
- (void)push:(id)object {
    [self addObject:object];
}
- (id)pop {
    if([self count] == 0)
        return nil;
    id obj = [self lastObject];
    [self removeLastObject];
    return obj;
}
@end
