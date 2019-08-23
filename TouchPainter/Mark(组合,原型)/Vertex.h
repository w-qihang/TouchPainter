//
//  Vertex.h
//  TouchPainter
//
//  Created by 汪启航 on 16/11/7.
//  Copyright © 2016年 汪启航. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

@interface Vertex : NSObject <Mark>  //顶点,只包含位置,不包含颜色粗细,部分抽象
{
/*
@private 私有的
私有，也就是只有自己有，别人谁都不可用，哪怕是子类。
@protected 受保护的
相较上边的private而言，他自己可以用，子类也是可以共享的
@public 公共的(默认的)
谁都可以用，只要你有这个类的对象，就可以拿到public下的变量
@package 包
这个主要是用于框架类，使用@private太限制，使用@protected或者@public又太开放，就使用这个package吧。
 */
    @protected
    CGPoint location_;
}
@property (nonatomic,retain) UIColor *color;
@property (nonatomic,assign) CGFloat size;
@property (nonatomic,assign) CGPoint location;
@property (nonatomic,readonly) NSUInteger count;
@property (nonatomic,readonly) id <Mark> lastChild;

- (id)initWithLocation:(CGPoint)location;

- (void)addMark:(id<Mark>) mark;
- (void)removeMark:(id<Mark>) mark;
- (id<Mark>) childMarkAtIndex:(NSUInteger) index;

- (id)copyWithZone:(NSZone *)zone;
- (void)acceptMarkVisitor:(id <MarkVisitor>)visitor;

- (id)initWithCoder:(NSCoder *)coder;
- (void)encodeWithCoder:(NSCoder *)coder;

@end
