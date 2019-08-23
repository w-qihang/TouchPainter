//
//  CanvasView.m
//  TouchPainter
//
//  Created by 汪启航 on 2019/7/24.
//  Copyright © 2019年 汪启航. All rights reserved.
//

#import "CanvasView.h"
#import "MarkRenderer.h"
#import "Mark.h"

@implementation CanvasView
@synthesize mark=mark_;

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    //创建访问者
    MarkRenderer *markRenderer = [[MarkRenderer alloc] initWithCGContext:context];
    //把renderer沿着组合结构传递
    [mark_ acceptMarkVisitor:markRenderer];
}

@end

//布质背景
@implementation ClothCanvasView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        //添加纸图像作为画布背景
        UIImage *backImg = [UIImage imageNamed:@"cloth"];
        UIImageView *backView = [[UIImageView alloc]initWithImage:backImg];
        [self addSubview:backView];
    }
    return self;
}

@end


//纸质背景
@implementation PaperCanvasView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        //添加纸图像作为画布背景
        UIImage *backImg = [UIImage imageNamed:@"paper"];
        UIImageView *backView = [[UIImageView alloc]initWithImage:backImg];
        [self addSubview:backView];
    }
    return self;
}

@end


