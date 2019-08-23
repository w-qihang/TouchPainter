//
//  ImageFilter.h
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/22.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageComponent.h"

NS_ASSUME_NONNULL_BEGIN

@interface ImageFilter : NSObject <ImageComponent>
{
    @private
    id <ImageComponent> component_;
}

@property (nonatomic,strong) id <ImageComponent> component;

- (void)apply;
- (id)initWithImageComponent:(id <ImageComponent>)component;
- (id)forwardingTargetForSelector:(SEL)aSelector;

@end

NS_ASSUME_NONNULL_END
