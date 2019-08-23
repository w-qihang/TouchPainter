//
//  Mark.h
//  TouchPainter
//
//  Created by 汪启航 on 16/11/7.
//  Copyright © 2016年 汪启航. All rights reserved.
//

/*
组合模式的主要意图是让树形结构中的每个节点具有相同的抽象接口.这样整个结构可以作为一个统一的抽象结构使用,不暴露内部表示.对每个节点的任何操作,可以通过协议或抽象基类中定义的相同接口来进行.
Cocoa Touch框架中,UIView被组织成一个组合结构.
 */

#import <UIKit/UIKit.h>
#import "MarkVisitor.h"

@protocol Mark <NSObject,NSCopying,NSCoding>  //组合模式,抽象化为轨迹,Mark聚合体, Vertex,Dot,Stroke的父类型,完全抽象化

@property (nonatomic,retain) UIColor *color;
@property (nonatomic,assign) CGFloat size;
@property (nonatomic,assign) CGPoint location;
@property (nonatomic,readonly) NSUInteger count;
@property (nonatomic,readonly) id <Mark> lastChild;

//原型 (子类型实现NSCopying协议来完成对自身的深拷贝)
- (id)copy;
- (void)addMark:(id<Mark>) mark;
- (void)removeMark:(id<Mark>) mark;
- (id<Mark>)childMarkAtIndex:(NSUInteger) index;
//绘制
- (void)drawWithContext:(CGContextRef)context;
//接受访问者
- (void)acceptMarkVisitor:(id <MarkVisitor>)visitor;

@end
