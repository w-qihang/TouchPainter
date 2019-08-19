//
//  ConsoleController.m
//  TouchPainter
//
//  Created by 汪启航 on 2019/7/31.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import "ConsoleController.h"

@implementation ConsoleController
@synthesize emulator=emulator_;

- (void)setCommand:(ConsoleCommand)command {
    [emulator_ loadInstructionsForCommand:command];
    [emulator_ executeInstructions];
}

@end

@implementation TouchConsoleController

- (void)up {
    [super setCommand:kConsoleCommandUp];
}
- (void)down {
    [super setCommand:kConsoleCommandDown];
}
- (void)left {
    [super setCommand:kConsoleCommandLeft];
}
- (void)right {
    [super setCommand:kConsoleCommandRight];
}
- (void)select {
    [super setCommand:kConsoleCommandSelect];
}
- (void)start {
    [super setCommand:kConsoleCommandStart];
}
- (void)action1 {
    [super setCommand:kConsoleCommandAction1];
}
- (void)action2 {
    [super setCommand:kConsoleCommandAction2];
}

@end
