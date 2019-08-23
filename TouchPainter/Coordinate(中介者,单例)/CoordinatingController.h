//
//  CoordinatingController.h
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/21.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CanvasViewController;

typedef enum
{
    kButtonTagDone,
    kButtonTagOpenPaletteView,
    kButtonTagOpenThumbnailView
} ButtonTag;

NS_ASSUME_NONNULL_BEGIN

@interface CoordinatingController : NSObject

@property (nonatomic, readonly) UIViewController *activeViewController;
@property (nonatomic, readonly) CanvasViewController *canvasViewController;

+ (CoordinatingController *)sharedInstance;
- (void)requestViewChangeByObject:(id)object;

@end

NS_ASSUME_NONNULL_END
