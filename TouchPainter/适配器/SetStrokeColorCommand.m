//
//  SetStrokeColorCommand.m
//  TouchPainter
//
//  Created by 汪启航 on 16/11/7.
//  Copyright © 2016年 汪启航. All rights reserved.
//

#import "SetStrokeColorCommand.h"

@implementation SetStrokeColorCommand

- (void)execute {
    CGFloat redValue = 0.0;
    CGFloat greenValue = 0.0;
    CGFloat blueValue = 0.0;
    
    if(_delegate && [_delegate respondsToSelector:@selector(command:didRequestColorComponentsForRed:green:blue:)]) {
        [_delegate command:self didRequestColorComponentsForRed:&redValue green:&greenValue blue:&blueValue];
    }
    UIColor *color = [UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1.0];
    
    //获取color后的操作
    
    
    if(_delegate && [_delegate respondsToSelector:@selector(command:didFinishColorUpdateWithColor:)]) {
        [_delegate command:self didFinishColorUpdateWithColor:color];
    }
}
@end
