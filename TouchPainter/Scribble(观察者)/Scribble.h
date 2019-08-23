//
//  Scribble.h
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/20.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ScribbleMemento.h"

@protocol Mark;

NS_ASSUME_NONNULL_BEGIN

@interface Scribble : NSObject
{
    @private
    id <Mark> parentMark_,incrementalMark_;
}

//管理Mark的方法
- (void)addMark:(id <Mark>)aMark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark;
- (void)removeMark:(id <Mark>)aMark;

//备忘录
- (id)initWithMemento:(ScribbleMemento *)aMemento;
+ (Scribble *)scribbleWithMemento:(ScribbleMemento *)aMemento;
- (ScribbleMemento *)scribbleMemento;
- (ScribbleMemento *)scribbleMementoWithCompleteSnapshot:(BOOL)hasCompleteSnapshot;
- (void)attachStateFromMemento:(ScribbleMemento *)memento;

@end

NS_ASSUME_NONNULL_END
