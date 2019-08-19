//
//  AttackHandler.h
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/2.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Attack;

NS_ASSUME_NONNULL_BEGIN

@interface AttackHandler : NSObject
{
    @private
    AttackHandler *nextAttackHandler_;
}
@property (nonatomic, retain) AttackHandler *nextAttackHandler;

- (void) handleAttack:(Attack *)attack;

@end


@interface MetalArmor : AttackHandler
{
    
}
- (void) handleAttack:(Attack *)attack;

@end


@interface CrystalShield : AttackHandler
{
    
}

- (void) handleAttack:(Attack *)attack;

@end


@interface Avatar : AttackHandler
{
    
}

- (void) handleAttack:(Attack *)attack;

@end

NS_ASSUME_NONNULL_END
