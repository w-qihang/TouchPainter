//
//  CharacterBuilder.h
//  Builder
//
//  Created by Carlo Chung on 11/27/10.
//  Copyright 2010 Carlo Chung. All rights reserved.
//


/*
 将一个复杂对象的构建与它的表现分离,使得同样的构建过程可以创建不同的表现
 Director(指导者)知道如何在缺少某些特定信息的情况下建造产品,以参数向其提供缺少的信息来建造特定产品,Builder(生成器)知道如何建造产品
 与抽象工厂不同的是:以多个步骤(在Builder中表现),多种方式(在Director中表现)构建对象,并在构建过程的最后一步返回产品.
 */

#import <Foundation/Foundation.h>
#import "Character.h"

@interface CharacterBuilder : NSObject 
{
  @protected
  Character *character_;
}

@property (nonatomic, readonly) Character *character;

- (CharacterBuilder *) buildNewCharacter;
- (CharacterBuilder *) buildStrength:(float) value;
- (CharacterBuilder *) buildStamina:(float) value;
- (CharacterBuilder *) buildIntelligence:(float) value;
- (CharacterBuilder *) buildAgility:(float) value;
- (CharacterBuilder *) buildAggressiveness:(float) value;

@end
