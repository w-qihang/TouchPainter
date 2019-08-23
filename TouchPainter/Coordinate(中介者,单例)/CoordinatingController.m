//
//  CoordinatingController.m
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/21.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import "CoordinatingController.h"
#import "CanvasViewController.h"
#import "PaletteViewController.h"
//#import "ThumbnailViewController.h"

@implementation CoordinatingController

#pragma mark - 单例
+ (CoordinatingController *)sharedInstance {
    static CoordinatingController *sharedCoordinator = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedCoordinator = [[self alloc] init];
    });
    return sharedCoordinator;
}
+ (id)allocWithZone:(struct _NSZone *)zone {
    return [self sharedInstance];
}
- (id)copy {
    return self;
}

#pragma mark - method for view transitions
- (void)requestViewChangeByObject:(id)object {
    if([object isKindOfClass:[UIBarButtonItem class]]) {
        switch ([(UIBarButtonItem *)object tag]) {
            case kButtonTagOpenPaletteView: {
                PaletteViewController *controller = [[PaletteViewController alloc] init];
                [_canvasViewController presentViewController:controller animated:YES completion:nil];
                _activeViewController = controller;
            }
                break;
            case kButtonTagOpenThumbnailView: {
//                ThumbnailViewController *controller = [[ThumbnailViewController alloc] init];
//                [_canvasViewController presentModalViewController:controller
//                _activeViewController = controller;
            }
                break;
            default: {
                [_canvasViewController dismissViewControllerAnimated:YES completion:nil];
                _activeViewController = _canvasViewController;
            }
                break;
        }
    }
    else {
        [_canvasViewController dismissViewControllerAnimated:YES completion:nil];
        _activeViewController = _canvasViewController;
    }
}

@end
