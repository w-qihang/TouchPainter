//
//  Stroke.m
//  TouchPainter
//
//  Created by 汪启航 on 16/11/7.
//  Copyright © 2016年 汪启航. All rights reserved.
//

#import "Stroke.h"
#import "Vertex.h"
#import "MarkEnumerator.h"

@implementation Stroke
@synthesize color=color_,size=size_;
@dynamic location;

- (id)init
{
    if(self = [super init])
    {
        children_ = [[NSMutableArray alloc]initWithCapacity:5];
    }
    return self;
}
- (void)setLocation:(CGPoint)location
{
    //不做任何位置设定
}
//返回第一个节点的位置
- (CGPoint)location
{
    if(children_.count>0)
    {
        Vertex *vertex = children_[0];
        return vertex.location;
    }
    return CGPointZero;
}
//节点数
- (NSUInteger)count
{
    return children_.count;
}
//最后一个节点
- (id<Mark>)lastChild
{
    return [children_ lastObject];
}

- (void)addMark:(id<Mark>)mark
{
    [children_ addObject:mark];
}
- (void)removeMark:(id<Mark>)mark
{
    if([children_ containsObject:mark])
    {
        [children_ removeObject:mark];
    }
    else
    {
        [children_ makeObjectsPerformSelector:@selector(removeMark:) withObject:mark];
    }
}
- (id<Mark>)childMarkAtIndex:(NSUInteger)index
{
    return children_[index];
}

- (id)copyWithZone:(NSZone *)zone
{
    Stroke *strokeCopy = [[[self class]allocWithZone:zone]init];
    strokeCopy.color = [UIColor colorWithCGColor:color_.CGColor];
    strokeCopy.size = size_;
    for (id<Mark> child in children_)
    {
        id <Mark> childCopy = [child copy];
        [strokeCopy addMark:childCopy];
    }
    return strokeCopy;
}
- (void)drawWithContext:(CGContextRef)context
{
    CGContextMoveToPoint(context, self.location.x, self.location.y);
    for(id<Mark> mark in children_)
    {
        [mark drawWithContext:context];
    }
    CGContextSetLineWidth(context, size_);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetStrokeColorWithColor(context, color_.CGColor);
    CGContextStrokePath(context);
}

#pragma mark - enumerator
- (NSEnumerator *)enumerator {
    return [[MarkEnumerator alloc]initWithMark:self];
}
- (void)enumeratorMarksUsingBlock:(void (^)(id <Mark> item, BOOL *stop))block {
    BOOL stop = NO;
    NSEnumerator *enumerator = [self enumerator];
    for (id <Mark> mark in enumerator) {
        block(mark,&stop);
        if(stop)
            break;
    }
}

- (void)acceptMarkVisitor:(id <MarkVisitor>)visitor {
    for (id <Mark> dot in children_) {
        [dot acceptMarkVisitor:visitor];
    }
    [visitor visitStroke:self];
}

#pragma mark - NSCoder methods

- (id)initWithCoder:(NSCoder *)coder
{
    if (self = [super init])
    {
        color_ = [coder decodeObjectForKey:@"StrokeColor"];
        size_ = [coder decodeFloatForKey:@"StrokeSize"];
        children_ = [coder decodeObjectForKey:@"StrokeChildren"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:color_ forKey:@"StrokeColor"];
    [coder encodeFloat:size_ forKey:@"StrokeSize"];
    [coder encodeObject:children_ forKey:@"StrokeChildren"];
}

@end
