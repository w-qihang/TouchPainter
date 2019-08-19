//
//  ConsoleEmulator.h
//  TouchPainter
//
//  Created by 汪启航 on 2019/7/31.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConsoleCommands.h"


NS_ASSUME_NONNULL_BEGIN
//仿真器的抽象类
@interface ConsoleEmulator : NSObject

//加载命令,由子类实现
- (void)loadInstructionsForCommand:(ConsoleCommand)command;
//执行命令,由子类实现
- (void)executeInstructions;
@end

@interface GameBoyEmulator : ConsoleEmulator

@end

@interface GameGearEmulator : ConsoleEmulator

@end
NS_ASSUME_NONNULL_END
