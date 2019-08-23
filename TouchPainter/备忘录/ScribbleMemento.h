//
//  ScribbleMemento.h
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/23.
//  Copyright © 2019年 q.h. All rights reserved.
//

/*
 在不破坏封装的前提下,捕获一个对象的内部状态,并在该对象之外保存这个状态,这样以后就可以h将该对象恢复到原先保存状态
 Scribble对象的作用不只是包含一个Mark实例,也把快照保存为备忘录对象,并交由看管人保存.
 ScribbleMemento(快照备忘录)本身可以是当时Scribble对象的完整结构,也可以是结构的一部分,作为内部状态的变更.保存-恢复只是在Scribble对象与它的备忘录对象之间发生,不涉及其他对象.因此ScribbleMemento的Friend分类的方法和属性只提供给Scribbled.
 ScribbleManager担任看管人的角色,保存和传递备忘录对象.
 */

#import <Foundation/Foundation.h>

@protocol Mark;

NS_ASSUME_NONNULL_BEGIN

@interface ScribbleMemento : NSObject
{
    @private
    id <Mark> mark_;
    BOOL hasCompleteSnapshot_;
}

+ (ScribbleMemento *)mementoWithData:(NSData *)data;
- (NSData *)data;

@end

NS_ASSUME_NONNULL_END
