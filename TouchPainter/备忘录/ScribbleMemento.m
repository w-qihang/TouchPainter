//
//  ScribbleMemento.m
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/23.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import "ScribbleMemento.h"
#import "ScribbleMemento+Friend.h"

@interface ScribbleMemento ()

@end

@implementation ScribbleMemento

- (NSData *)data {
    return [NSKeyedArchiver archivedDataWithRootObject:mark_ requiringSecureCoding:NO error:NULL];
}

+ (ScribbleMemento *)mementoWithData:(NSData *)data {
    id <Mark> retoredMark = (id <Mark>)[NSKeyedUnarchiver unarchivedObjectOfClass:[NSObject class] fromData:data error:NULL];
    ScribbleMemento *memento = [[ScribbleMemento alloc]initWithMark:retoredMark];
    return memento;
}

@end
