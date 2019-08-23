//
//  ImageTransformFilter.h
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/22.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import "ImageFilter.h"

NS_ASSUME_NONNULL_BEGIN

@interface ImageTransformFilter : ImageFilter
{
    @private
    CGAffineTransform transform_;
}

@property (nonatomic,assign) CGAffineTransform transform;

- (instancetype)initWithImageComponent:(id <ImageComponent>)component
                    transform:(CGAffineTransform)transform;
- (void)apply;

@end

NS_ASSUME_NONNULL_END
