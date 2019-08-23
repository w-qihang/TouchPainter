//
//  ScribbleThumbnailViewImageProxy.m
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/23.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import "ScribbleThumbnailViewImageProxy.h"


@interface ScribbleThumbnailViewImageProxy ()
//私有
- (void)forwardImageLoadingThread;
@end

@implementation ScribbleThumbnailViewImageProxy
@dynamic imagePath;

- (UIImage *)image {
    if(realImage_ == nil) {
        realImage_ = [[UIImage alloc]initWithContentsOfFile:imagePath_];
    }
    return realImage_;
}

- (void)drawRect:(CGRect)rect {
    if(realImage_ == nil) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        //虚线绘制占位图框
        CGContextSetLineWidth(context, 10.0);
        const CGFloat dashLengths[2] = {10,3};
        CGContextSetLineDash (context, 3, dashLengths, 2);
        CGContextSetStrokeColorWithColor(context, [[UIColor darkGrayColor] CGColor]);
        CGContextSetFillColorWithColor(context, [[UIColor lightGrayColor] CGColor]);
        CGContextAddRect(context, rect);
        CGContextDrawPath(context, kCGPathFillStroke);
        //启动子线程加载
        if (!loadingThreadHasLaunched_) {
            [self performSelectorInBackground:@selector(forwardImageLoadingThread)
                                   withObject:nil];
            loadingThreadHasLaunched_ = YES;
        }
    }
    else {
        [realImage_ drawInRect:rect];
    }
}

#pragma mark - Private
- (void)forwardImageLoadingThread {
    @autoreleasepool {
        [self image];
        [self performSelectorInBackground:@selector(setNeedsDisplay) withObject:nil];
    }
}

@end
