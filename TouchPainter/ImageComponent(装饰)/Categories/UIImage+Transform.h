//
//  UIImage+Transform.h
//  Decorator
//
//  Created by Carlo Chung on 11/15/10.
//  Copyright 2010 Carlo Chung. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIImage (Transform)

- (UIImage *) imageWithTransform:(CGAffineTransform)transform;

@end
