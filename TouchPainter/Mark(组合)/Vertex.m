//
//  Vertex.m
//  TouchPainter
//
//  Created by 汪启航 on 16/11/7.
//  Copyright © 2016年 汪启航. All rights reserved.
//

#import "Vertex.h"

@implementation Vertex
@synthesize location=location_;
@dynamic color,size;

- (id)initWithLocation:(CGPoint)location
{
    if(self = [super init])
    {
        location_ = location;
    }
    return self;
}
//默认属性什么也不做
- (void)setColor:(UIColor *)color {}
- (UIColor*)color {return nil;}
- (void)setSize:(CGFloat)size {}
- (CGFloat)size {return 0;}
- (id<Mark>) lastChild {return nil;}
- (NSUInteger)count {return 0;}


//Mark操作什么也不做
- (void)addMark:(id<Mark>) mark {}
- (void)removeMark:(id<Mark>) mark {}
- (id<Mark>) childMarkAtIndex:(NSUInteger) index {return nil;}

- (id)copyWithZone:(NSZone *)zone
{
    Vertex *vertexCopy = [[[self class]allocWithZone:zone] initWithLocation:location_];
    return vertexCopy;
}

- (void)drawWithContext:(CGContextRef)context
{
    CGContextAddLineToPoint(context, location_.x, location_.y);
}

- (void)acceptMarkVisitor:(id <MarkVisitor>)visitor {
    [visitor visitVertex:self];
}

@end
