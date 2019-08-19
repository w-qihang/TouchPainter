//
//  InputValidator.h
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/5.
//  Copyright © 2019年 q.h. All rights reserved.
//

/*
 定义一系列算法,把它们一个个封装起来,并且使它们可相互替换.本模式使得算法可独立于使用它的客户而变化
 何时使用:
 一个类在其操作中使用多个条件语句来定义许多行为.我们可以把相关的条件分支移到它们的策略类中
 需要算法的各种变体
 需要避免把复杂的,与算法相关的数据结构暴露给客户端
 */

#import <UIKit/UIKit.h>

static NSString * const InputValidationErrorDomain = @"InputValidationErrorDomain";

NS_ASSUME_NONNULL_BEGIN

@interface InputValidator : NSObject

- (BOOL)validateInput:(UITextField *)input error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
