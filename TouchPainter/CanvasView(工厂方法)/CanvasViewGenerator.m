//
//  CanvasViewGenerator.m
//  TouchPainter
//
//  Created by 汪启航 on 2019/7/24.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import "CanvasViewGenerator.h"
#import "CanvasView.h"

//背景生成器
@implementation CanvasViewGenerator

- (CanvasView *)canvasViewWithFrame:(CGRect)frame {
    return [[CanvasView alloc]initWithFrame:frame];
}

@end


@implementation ClothCanvasViewGenerator

- (CanvasView *)canvasViewWithFrame:(CGRect)frame {
    return [[ClothCanvasView alloc]initWithFrame:frame];
}

@end


@implementation PaperCanvasViewGenerator

- (CanvasView *)canvasViewWithFrame:(CGRect)frame {
    return [[PaperCanvasView alloc]initWithFrame:frame];
}

@end
