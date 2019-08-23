//
//  ScribbleThumbnailView.h
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/23.
//  Copyright © 2019年 q.h. All rights reserved.
//

/*
 通常,代理是一种替代或者占位,它控制对另一些对象的访问,这些对象可能是u远程对象,创建开销较大的对象,或是对安全性有要求的对象.
 代理模式的思想是使用一个基本上跟实体对象行为相同的代理,当客户端请求某些创建开销较大的功能时,代理将把请求转发给实体对象.
 在iOS应用中使用代理模式,对开销大的数据实施懒加载,如文件系统中的大图像文件或者低速网络从服务器下载大型数据.如果大开销的对象在收到请求之前不需要加载,则可通过虚拟代理向客户端提供某些轻量的信息
 Objective-C不支持多重继承,如果代理对象不是Cocoa Touch框架中的任何子类的话,可以考虑使用NSProxy作为占位或代理对象.
 NSProxy是一个抽象基类,没有自己的初始化方法,它的存在只有一个目的--当代理.
 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScribbleThumbnailView : UIView
{
    @protected
    NSString *imagePath_;
}
@property (nonatomic,strong,readonly) UIImage *image;
@property (nonatomic,copy) NSString *imagePath;

@end

NS_ASSUME_NONNULL_END
