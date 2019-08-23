//
//  ScribbleMemento+Friend.h
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/23.
//  Copyright © 2019年 q.h. All rights reserved.
//

/*
 这里面的属性和方法只暴露给 Scribble使用
 */

#import "ScribbleMemento.h"

@protocol Mark;

NS_ASSUME_NONNULL_BEGIN

@interface ScribbleMemento (Friend)

@property (nonatomic,copy) id <Mark> mark;
@property (nonatomic,assign) BOOL hasCompleteSnapshot; //告诉Scribble对象,保存的Mark引用是完整的快照还是只是个片段

- (instancetype)initWithMark:(id <Mark>)aMark;

@end

NS_ASSUME_NONNULL_END
