//
//  MarkEnumerator.h
//  TouchPainter
//
//  Created by 汪启航 on 2018/6/12.
//  Copyright © 2018年 汪启航. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableArray+Stack.h"
#import "Mark.h"

@interface MarkEnumerator : NSEnumerator
{
    @private
    NSMutableArray *stack_;
}
- (NSArray *)allObjects;
- (id)nextObject;

- (id)initWithMark:(id <Mark>)mark;

@end
