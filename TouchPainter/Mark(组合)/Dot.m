//
//  Dot.m
//  TouchPainter
//
//  Created by 汪启航 on 16/11/7.
//  Copyright © 2016年 汪启航. All rights reserved.
//

#import "Dot.h"

@implementation Dot
@synthesize size = size_,color = color_;

- (id)copyWithZone:(NSZone *)zone
{
    Dot *dotCopy = [[[self class] allocWithZone:zone]initWithLocation:location_];
    dotCopy.size = size_;
    dotCopy.color = [UIColor colorWithCGColor:color_.CGColor];
    return dotCopy;
}
- (void)drawWithContext:(CGContextRef)context
{
    CGContextSetFillColorWithColor(context, color_.CGColor);
    CGContextFillEllipseInRect(context, CGRectMake(location_.x-size_/2, location_.y-size_/2, size_, size_));
}
- (void)acceptMarkVisitor:(id <MarkVisitor>)visitor {
    [visitor visitDot:self];
}

@end
