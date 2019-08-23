//
//  Command.h
//  TouchPainter
//
//  Created by 汪启航 on 2018/6/5.
//  Copyright © 2018年 汪启航. All rights reserved.
//

/*
 将请求封装成对象,从而可用不同的请求对客户进行参数化,对请求排队或记录请求日志,以及支持可撤销的操作.
 NSInvocation,NSUndoManager和"目标-动作"机制是框架对这个模式的典型应用.
 */

#import <Foundation/Foundation.h>

@interface Command : NSObject
{
    @protected
    NSDictionary *userInfo_;
}
- (void)execute;
- (void)undo;

@end
