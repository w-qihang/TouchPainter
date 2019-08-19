//
//  NSMutableArray+Stack.h
//  TouchPainter
//
//  Created by 汪启航 on 2018/6/12.
//  Copyright © 2018年 汪启航. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Stack)

- (void)push:(id)object;
- (id)pop;
@end
