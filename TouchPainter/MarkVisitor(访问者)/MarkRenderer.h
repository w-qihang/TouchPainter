//
//  MarkRenderer.h
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/2.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MarkVisitor.h"

@protocol Mark;
@class Dot,Vertex,Stroke;

NS_ASSUME_NONNULL_BEGIN

@interface MarkRenderer : NSObject <MarkVisitor>
{
    @private
    BOOL shouldMoveContextToDot_;
    
    @protected
    CGContextRef context_;
}

- (void)visitMark:(id <Mark>)mark;
- (void)visitDot:(Dot *)dot;
- (void)visitVertex:(Vertex *)vertex;
- (void)visitStroke:(Stroke *)stroke;

- (id)initWithCGContext:(CGContextRef)context;

@end

NS_ASSUME_NONNULL_END
