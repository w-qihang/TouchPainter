//
//  CanvasViewController.m
//  TouchPainter
//
//  Created by 汪启航 on 2019/7/24.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import "CanvasViewController.h"
#import "CanvasView.h"
#import "CanvasViewGenerator.h"

@interface CanvasViewController ()
{
    @private
    CanvasView *canvasView_; //画布视图
}
@end

@implementation CanvasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator {
    [canvasView_ removeFromSuperview];
    canvasView_ = [generator canvasViewWithFrame:CGRectMake(0, 0, 320, 436)];
    [self.view addSubview:canvasView_];
}

@end
