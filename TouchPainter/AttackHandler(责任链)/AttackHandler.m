//
//  AttackHandler.m
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/2.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import "AttackHandler.h"
#import "Attack.h"

@implementation AttackHandler
@synthesize nextAttackHandler=nextAttackHandler_;

- (void)handleAttack:(Attack *)attack {
    [nextAttackHandler_ handleAttack:attack];
}

@end


@implementation MetalArmor

- (void)handleAttack:(Attack *)attack
{
    if ([attack isKindOfClass:[SwordAttack class]])
    {
        // no damage beyond this armor
        NSLog(@"%@", @"No damage from a sword attack!");
    }
    else
    {
        NSLog(@"I don't know this attack: %@", [attack class]);
        [super handleAttack:attack];
    }
}

@end


@implementation CrystalShield

- (void)handleAttack:(Attack *)attack
{
    if ([attack isKindOfClass:[MagicFireAttack class]])
    {
        // no damage beyond this shield
        NSLog(@"%@", @"No damage from a magic fire attack!");
    }
    else
    {
        NSLog(@"I don't know this attack: %@", [attack class]);
        [super handleAttack:attack];
    }
}

@end


@implementation Avatar

- (void)handleAttack:(Attack *)attack
{
    // when an attack reaches this point,
    // I'm hit.
    // actual points taken off depends on
    // the type of attack.
    NSLog(@"Oh! I'm hit with a %@!", [attack class]);
}


@end
