//
//  CanvasView.h
//  TouchPainter
//
//  Created by 汪启航 on 2019/7/24.
//  Copyright © 2019年 汪启航. All rights reserved.
//




/*
 工厂方法:让子类决定实例化哪一个类
 例如CocoaTouch框架中的 NSNumber numberWith* (类工厂方法,没有返回生成器,工厂方法模式可以用这种变体进行简化)
 */



#import <UIKit/UIKit.h>

@protocol Mark;

NS_ASSUME_NONNULL_BEGIN

//画布视图
@interface CanvasView : UIView
{
    @private
    id <Mark> mark_;
}
@property (nonatomic,strong) id <Mark> mark;
@end


//cloth
@interface ClothCanvasView : CanvasView

//一些私有变量,特定行为
@end


//paper
@interface PaperCanvasView : CanvasView

//一些私有变量,特定行为
@end



NS_ASSUME_NONNULL_END
