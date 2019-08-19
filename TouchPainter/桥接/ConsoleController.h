//
//  ConsoleController.h
//  TouchPainter
//
//  Created by 汪启航 on 2019/7/31.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConsoleEmulator.h"
#import "ConsoleCommands.h"

NS_ASSUME_NONNULL_BEGIN
//虚拟控制器
@interface ConsoleController : NSObject
{
    @private
    ConsoleEmulator *emulator_;
}
@property (nonatomic,strong) ConsoleEmulator *emulator; //具体的仿真器

- (void)setCommand:(ConsoleCommand)command;

@end

@interface TouchConsoleController : ConsoleController

- (void)up;
- (void)down;
- (void)left;
- (void)right;
- (void)select;
- (void)start;
- (void)action1;
- (void)action2;
@end

NS_ASSUME_NONNULL_END
