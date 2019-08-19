//
//  Dot.h
//  TouchPainter
//
//  Created by 汪启航 on 16/11/7.
//  Copyright © 2016年 汪启航. All rights reserved.
//

#import "Vertex.h"

@interface Dot : Vertex //实体的点,包含位置,颜色,粗细等属性
{
    @private
    UIColor *color_;
    CGFloat size_;
}
@property (nonatomic,retain) UIColor *color;
@property (nonatomic,assign) CGFloat size;

- (id)copyWithZone:(NSZone *)zone;
- (void)acceptMarkVisitor:(id <MarkVisitor>)visitor;

@end
