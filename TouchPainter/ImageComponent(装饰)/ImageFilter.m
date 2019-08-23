//
//  ImageFilter.m
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/22.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import "ImageFilter.h"

@implementation ImageFilter
@synthesize component=component_;

- (instancetype)initWithImageComponent:(id<ImageComponent>)component {
    if(self = [super init]) {
        [self setComponent:component];
    }
    return self;
}

- (void)apply {
    
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if([NSStringFromSelector(aSelector) hasPrefix:@"draw"]) {
        [self apply];
    }
    return component_;
}

@end
