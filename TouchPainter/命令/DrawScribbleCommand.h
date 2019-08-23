//
//  DrawScribbleCommand.h
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/22.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import "Command.h"

extern NSString * const ScribbleObjectUserInfoKey;
extern NSString * const MarkObjectUserInfoKey;
extern NSString * const AddToPreviousMarkUserInfoKey;

@class Scribble;
@protocol Mark;

NS_ASSUME_NONNULL_BEGIN

@interface DrawScribbleCommand : Command
{
    @private
    Scribble *scribble_;
    id <Mark> mark_;
    BOOL shouldAddToPreviousMark_;
}
- (void)execute;
- (void)undo;

@end

NS_ASSUME_NONNULL_END
