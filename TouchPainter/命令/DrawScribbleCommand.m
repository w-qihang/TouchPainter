//
//  DrawScribbleCommand.m
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/22.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import "DrawScribbleCommand.h"
#import "Scribble.h"

NSString * const ScribbleObjectUserInfoKey = @"ScribbleObjectUserInfoKey";
NSString * const MarkObjectUserInfoKey = @"MarkObjectUserInfoKey";
NSString * const AddToPreviousMarkUserInfoKey = @"AddToPreviousMarkUserInfoKey";

@implementation DrawScribbleCommand

- (void)execute {
    if(!userInfo_) return;
    
    scribble_ = [userInfo_ objectForKey:ScribbleObjectUserInfoKey];
    mark_ = [userInfo_ objectForKey:MarkObjectUserInfoKey];
    shouldAddToPreviousMark_ = [(NSNumber *)[userInfo_ objectForKey:AddToPreviousMarkUserInfoKey] boolValue];
    [scribble_ addMark:mark_ shouldAddToPreviousMark:shouldAddToPreviousMark_];
}
- (void)undo {
    [scribble_ removeMark:mark_];
}
@end
