//
//  Attack.h
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/2.
//  Copyright © 2019年 q.h. All rights reserved.
//

/*
 责任链模式的主要思想是,对象引用了同一类型的另一个对象,形成一条链.链中的每个对象实现了同样的方法,处理对链中y第一个对象发起的同一个请求.如果一个对象不知福如何处理请求,就传给下一个响应器.
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Attack : NSObject

@end

@interface SwordAttack : Attack
{
    
}
@end

@interface MagicFireAttack : Attack
{
    
}
@end

@interface LightningAttack : Attack
{
    
}
@end

NS_ASSUME_NONNULL_END
