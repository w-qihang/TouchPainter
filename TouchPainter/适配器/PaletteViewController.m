//
//  PaletteViewController.m
//  TouchPainter
//
//  Created by 汪启航 on 2018/6/6.
//  Copyright © 2018年 汪启航. All rights reserved.
//

#import "PaletteViewController.h"
#import "SetStrokeColorCommand.h"
#import "CommandSlider.h"

//适配器(委托)
@interface PaletteViewController () <SetStrokeColorCommandDelegate>
{
    CommandSlider *redSlider_,*greenSlider_,*blueSlider_; //被适配者(对象适配)
    UIView *paletteView_;
}
@end

@implementation PaletteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    redSlider_ = [[CommandSlider alloc]initWithFrame:CGRectMake(50, 100, 100, 20)];
    greenSlider_ = [[CommandSlider alloc]initWithFrame:CGRectMake(50, 150, 100, 20)];
    blueSlider_ = [[CommandSlider alloc]initWithFrame:CGRectMake(50, 200, 100, 20)];
    
    [self.view addSubview:redSlider_];
    [self.view addSubview:greenSlider_];
    [self.view addSubview:blueSlider_];
    [redSlider_ addTarget:self action:@selector(onCommandSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [greenSlider_ addTarget:self action:@selector(onCommandSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [blueSlider_ addTarget:self action:@selector(onCommandSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
}

#pragma mark Action
- (void)onCommandSliderValueChanged:(CommandSlider *)slider {
    [slider.command execute];
}
#pragma mark SetStrokeColorCommandDelegate
- (void)command:(SetStrokeColorCommand *)command didRequestColorComponentsForRed:(CGFloat *)red green:(CGFloat *)green blue:(CGFloat *)blue {
    *red = [redSlider_ value];
    *green = [greenSlider_ value];
    *blue = [blueSlider_ value];
}
- (void)command:(SetStrokeColorCommand *)command didFinishColorUpdateWithColor:(UIColor *)color {
    [paletteView_ setBackgroundColor:color];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
