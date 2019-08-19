//
//  NumericInputValidator.h
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/5.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import "InputValidator.h"

NS_ASSUME_NONNULL_BEGIN

@interface NumericInputValidator : InputValidator

//保证输入只包含数字(0~9)的验证方法
- (BOOL)validateInput:(UITextField *)input error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
