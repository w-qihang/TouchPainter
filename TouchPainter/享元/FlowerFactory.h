//
//  FlowerFactory.h
//  Flyweight
//
//  Created by Carlo Chung on 11/29/10.
//  Copyright 2010 Carlo Chung. All rights reserved.
//

/*
 运用共享技术有效地支持大量粒度的对象
 何时使用:
 应用程序使用很多对象
 在内存中保存对象会影响内存性能
 */

#import <UIKit/UIKit.h>

typedef enum 
{
  kAnemone,
  kCosmos,
  kGerberas,
  kHollyhock,
  kJasmine,
  kZinnia,
  kTotalNumberOfFlowerTypes
} FlowerType;

@interface FlowerFactory : NSObject 
{
  @private
  NSMutableDictionary *flowerPool_;
}

- (UIView *) flowerViewWithType:(FlowerType)type;

@end
