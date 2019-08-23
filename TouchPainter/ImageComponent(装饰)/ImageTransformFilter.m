//
//  ImageTransformFilter.m
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/22.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import "ImageTransformFilter.h"

@implementation ImageTransformFilter
@synthesize transform=transform_;

- (instancetype)initWithImageComponent:(id<ImageComponent>)component transform:(CGAffineTransform)transform {
    if(self = [super initWithImageComponent:component]) {
        [self setTransform:transform];
    }
    return self;
}
- (void)apply {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextConcatCTM(context, transform_);
}
@end
