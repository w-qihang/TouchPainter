//
//  ScribbleManager.h
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/21.
//  Copyright © 2019年 q.h. All rights reserved.
//

/*
 为系统中的一组接口提供一个统一的接口.外观定义一个高层接口,让子系统更易于使用.
 当子系统逐渐变得复杂,应用模式的过程中演化出许多类,可以使用外观为这些子系统类提供一个较简单的接口.
 */

#import <UIKit/UIKit.h>
@class Scribble;

NS_ASSUME_NONNULL_BEGIN

@interface ScribbleManager : NSObject

- (void)saveScribble:(Scribble *)scribble thumbnail:(UIImage *)image;
- (NSInteger)numberOfScribbles;
- (Scribble *)scribbleAtIndex:(NSInteger)index;
- (UIView *)scribbleThumbnailViewAtIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
