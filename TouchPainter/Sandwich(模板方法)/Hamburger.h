//
//  Hamburger.h
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/5.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import "AnySandwich.h"

NS_ASSUME_NONNULL_BEGIN

@interface Hamburger : AnySandwich

- (void) prepareBread;
- (void) addMeat;
- (void) addCondiments;
//- (void) extraStep;

//汉堡包特有方法
- (void) getBurgerBun;
- (void) addKetchup;
- (void) addMustard;
- (void) addBeefPatty;
- (void) addCheese;
- (void) addPickles;

@end

NS_ASSUME_NONNULL_END
