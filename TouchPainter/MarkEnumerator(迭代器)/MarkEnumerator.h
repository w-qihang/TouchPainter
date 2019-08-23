//
//  MarkEnumerator.h
//  TouchPainter
//
//  Created by 汪启航 on 2018/6/12.
//  Copyright © 2018年 汪启航. All rights reserved.
//

/*
 提供一种方法顺序访问一个聚合对象中的各个元素,而不需要暴露该对象的内部表示.
 分两种:内部迭代器和外部迭代器.
 何时使用:
 需要访问组合对象内容,而又不暴露其内部表示
 需要通过多种方式遍历组合对象
 需要提供一个统一的k接口,用来遍历各种类型的组合对象
 */

#import <Foundation/Foundation.h>

@protocol Mark;

@interface MarkEnumerator : NSEnumerator
{
    @private
    NSMutableArray *stack_;
}
- (NSArray *)allObjects;
- (id)nextObject;

- (id)initWithMark:(id <Mark>)mark;

@end
