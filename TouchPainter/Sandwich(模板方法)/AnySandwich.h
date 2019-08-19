//
//  AnySandwich.h
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/5.
//  Copyright © 2019年 q.h. All rights reserved.
//

/*
 在抽象类的一个方法中定义"标准"算法,在这个方法中调用的基本操作应由子类重载予以实现.这个方法被称为模板.
 cocoa框架中使用的模板方法:- (void)drawRect:(CGRect)rect; UIView的子类如果真的需要绘制自己的视图,就重载这个方法.这是个"钩子"方法
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AnySandwich : NSObject

- (void)make;
- (void)prepareBread;
- (void)putBreadOnPlate;
- (void)addMeat;
- (void)addCondiments;
- (void)serve;

@end

NS_ASSUME_NONNULL_END
