//
//  CanvasViewController.h
//  TouchPainter
//
//  Created by 汪启航 on 2019/7/24.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Scribble;

NS_ASSUME_NONNULL_BEGIN

@interface CanvasViewController : UIViewController

@property (nonatomic,strong) Scribble *scribble;

@end

NS_ASSUME_NONNULL_END
