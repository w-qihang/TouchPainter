//
//  Stroke.h
//  TouchPainter
//
//  Created by 汪启航 on 16/11/7.
//  Copyright © 2016年 汪启航. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"
@interface Stroke : NSObject<Mark,NSCopying> //线条,一个数组来保存Mark类型,组合结构
{
    @private
    UIColor *color_;
    CGFloat size_;
    NSMutableArray *children_; 
}
@property (nonatomic,retain) UIColor *color;
@property (nonatomic,assign) CGFloat size;
@property (nonatomic,assign) CGPoint location;
@property (nonatomic,readonly) NSUInteger count;
@property (nonatomic,readonly) id <Mark> lastChild;

- (id)copyWithZone:(NSZone *)zone;

//只使用内部迭代器,则注释此方法
//- (NSEnumerator *)enumerator;

//用于实现内部迭代器
- (void)enumeratorMarksUsingBlock:(void (^)(id <Mark> item, BOOL *stop))block;
- (void)acceptMarkVisitor:(id <MarkVisitor>)visitor;
@end
