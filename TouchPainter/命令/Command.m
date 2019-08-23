//
//  Command.m
//  TouchPainter
//
//  Created by 汪启航 on 2018/6/5.
//  Copyright © 2018年 汪启航. All rights reserved.
//

#import "Command.h"

@implementation Command

- (void)execute {
    [NSException raise:NSInternalInconsistencyException format:@"You must override %@ in a subclass",NSStringFromSelector(_cmd)];
}
- (void)undo {
    
}
@end
