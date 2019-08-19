//
//  MarkVisitor.h
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/2.
//  Copyright © 2019年 q.h. All rights reserved.
//

/*
 访问者模式涉及两个角色:访问者和它访问的元素.元素可以是任何对象,但通常是"部分-整体"结构中的节点(包含组合体与叶节点,或者其他复杂的对象结构).
 它让我们可以在不改变各元素的类的前提下定义作用于这些元素的新操作.有个需要注意的缺点就是访问者与目标类耦合在一起.
 何时使用访问者:定义复杂结构的类很少作修改,但经常需要向其添加新的操作.
 使用分类也能扩展类的行为,但是对于复杂结构来讲,不如访问者方便(因为结构中每个节点类都要创建分类,与直接修改差别不大).
 */

#import <Foundation/Foundation.h>

@protocol Mark;
@class Dot,Vertex,Stroke;

NS_ASSUME_NONNULL_BEGIN

@protocol MarkVisitor <NSObject>

- (void)visitMark:(id <Mark>)mark;
- (void)visitDot:(Dot *)dot;
- (void)visitVertex:(Vertex *)vertex;
- (void)visitStroke:(Stroke *)stroke;

@end

NS_ASSUME_NONNULL_END
