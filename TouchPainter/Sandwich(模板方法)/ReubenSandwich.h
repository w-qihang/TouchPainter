//
//  ReubenSandwich.h
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/5.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import "AnySandwich.h"

NS_ASSUME_NONNULL_BEGIN

@interface ReubenSandwich : AnySandwich

- (void)prepareBread;
- (void)addMeat;
- (void)addCondiments;

//鲁宾三明治特有操作
- (void) cutRyeBread;
- (void) addCornBeef;
- (void) addSauerkraut;
- (void) addThousandIslandDressing;
- (void) addSwissCheese;
- (void) grillIt;

@end

NS_ASSUME_NONNULL_END
