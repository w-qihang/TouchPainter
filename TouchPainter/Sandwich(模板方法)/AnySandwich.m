//
//  AnySandwich.m
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/5.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import "AnySandwich.h"

@implementation AnySandwich

- (void) make {
    [self prepareBread];
    [self putBreadOnPlate];
    [self addMeat];
    [self addCondiments];
    [self extraStep];
    [self serve];
}

- (void) putBreadOnPlate
{
    //做任何三明治都要先把面包放在盘子上
}

- (void) serve
{
    //任何三明治做好了都要上餐
}

#pragma mark -
#pragma 子类重载的方法

- (void)prepareBread {
    [NSException raise:NSInternalInconsistencyException format:@"You must override %@ in a subclass",NSStringFromSelector(_cmd)];
}
- (void)addMeat {
    [NSException raise:NSInternalInconsistencyException format:@"You must override %@ in a subclass",NSStringFromSelector(_cmd)];
}
- (void)addCondiments {
    [NSException raise:NSInternalInconsistencyException format:@"You must override %@ in a subclass",NSStringFromSelector(_cmd)];
}
- (void)extraStep {
    
}

@end
