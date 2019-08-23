//
//  ScribbleThumbnailViewImageProxy.h
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/23.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import "ScribbleThumbnailView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ScribbleThumbnailViewImageProxy : ScribbleThumbnailView
{
    @private
    UIImage *realImage_;
    BOOL loadingThreadHasLaunched_;
}
//@property (nonatomic,strong,readonly) UIImage *image;
@end

NS_ASSUME_NONNULL_END
