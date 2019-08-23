//
//  ImageShadowFilter.m
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/22.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import "ImageShadowFilter.h"

@implementation ImageShadowFilter

- (void)apply {
    CGContextRef context = UIGraphicsGetCurrentContext();
    // set up shadow
    CGSize offset = CGSizeMake (-25,  15);
    CGContextSetShadow(context, offset, 20.0);
}

@end
