//
//  BrandingFactory.h
//  TouchPainter
//
//  Created by 汪启航 on 2019/7/24.
//  Copyright © 2019年 q.h. All rights reserved.
//

/*
 类簇是基础框架中常见的一种设计模式,基于抽象工厂模式的思想.将若干相关的私有具体工厂子类集合到一个公有抽象超类之下.NSNumber有一系列公有API,定义了各种类型的数所共有的行为.
 其他实现为类簇的基础类有NSData,NSArray,NSDictionary,NSString.
 对比抽象工厂和工厂:
 抽象工厂: 1.创建多系列产品 2.只需修改抽象父类接口以支持新的产品
 工厂方法: 1.创建一种产品 2.子类化新的创建者并重载工厂方法
 如果抛开"抽象"一词,"工厂"通常指"具体"工厂.NSNumber是个抽象工厂,而NSCFBoolean与NSCFNumber是工厂(具体的).
 有时一开始在设计中使用具体工厂,而后将其重构为使用多个具体工厂的抽象工厂.
 */

#import <UIKit/UIKit.h>

#define USE_ACME 1
#define USE_SIERRA 0

NS_ASSUME_NONNULL_BEGIN

@interface BrandingFactory : NSObject

+ (BrandingFactory *)factory;

- (UIView *)brandedView;
- (UIButton *)brandedMainButton;
- (UIToolbar *)brandedToolbar;
@end


@interface AcmeBrandingFactory : BrandingFactory

- (UIView *)brandedView;
- (UIButton *)brandedMainButton;
- (UIToolbar *)brandedToolbar;
@end

@interface AcmeView : UIView

@end

@interface AcmeMainButton : UIButton

@end

@interface AcmeToolbar : UIToolbar

@end


@interface SierraBrandingFactory : BrandingFactory

- (UIView *)brandedView;
- (UIButton *)brandedMainButton;
- (UIToolbar *)brandedToolbar;
@end

@interface SierraView : UIView

@end

@interface SierraMainButton : UIButton

@end

@interface SierraToolbar : UIToolbar

@end

NS_ASSUME_NONNULL_END
