//
//  CanvasViewGenerator.h
//  TouchPainter
//
//  Created by 汪启航 on 2019/7/24.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CanvasView;

NS_ASSUME_NONNULL_BEGIN

//工厂生成器生成CanvasView,具体生成的对象由子类决定
@interface CanvasViewGenerator : NSObject

- (CanvasView *)canvasViewWithFrame:(CGRect)frame; //此方法由子类重载
@end

@interface ClothCanvasViewGenerator : NSObject

- (CanvasView *)canvasViewWithFrame:(CGRect)frame;
@end

@interface PaperCanvasViewGenerator : NSObject

- (CanvasView *)canvasViewWithFrame:(CGRect)frame;
@end

NS_ASSUME_NONNULL_END
