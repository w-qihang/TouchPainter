//
//  ImageComponent.h
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/22.
//  Copyright © 2019年 q.h. All rights reserved.
//

/*
 动态地给一个对象添加一些额外的职责.就扩展功能来说,装饰模式相比生成子类更为灵活.
 可以通过分类实现装饰,实现了模式的意图,是一种变体.在实现少量的装饰器的时候,它比真正子类方式更为轻量,更为容易.
 */


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ImageComponent <NSObject>

@optional
- (void) drawAsPatternInRect:(CGRect)rect;
- (void) drawAtPoint:(CGPoint)point;
- (void) drawAtPoint:(CGPoint)point blendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha;
- (void) drawInRect:(CGRect)rect;
- (void) drawInRect:(CGRect)rect blendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha;

@end


@interface UIImage (ImageComponent) <ImageComponent>

@end

NS_ASSUME_NONNULL_END

