//
//  SetStrokeColorCommand.h
//  TouchPainter
//
//  Created by 汪启航 on 16/11/7.
//  Copyright © 2016年 汪启航. All rights reserved.
//


/*
 将一个类的接口转换成客户希望的另一个接口.适配器模式使得原本由于接口不兼容而不能一起工作的那些类可以一起工作.
 Cocoa Touch框架中许多框架类,是用协议中定义的某种形式的委托来实现的, 协议定义的方法 = 目标接口 , delegate(委托) = 适配器
 */


#import <Foundation/Foundation.h>
#import "Command.h"
#import <UIKit/UIKit.h>

@class SetStrokeColorCommand;

//目标接口
@protocol SetStrokeColorCommandDelegate <NSObject>

- (void)command:(SetStrokeColorCommand*) command didRequestColorComponentsForRed:(CGFloat *) red green:(CGFloat *)green blue:(CGFloat *) blue;
- (void)command:(SetStrokeColorCommand *)command didFinishColorUpdateWithColor:(UIColor *) color;

@end


//客户端
@interface SetStrokeColorCommand : Command

@property (nonatomic,weak) id <SetStrokeColorCommandDelegate> delegate; 
@end
