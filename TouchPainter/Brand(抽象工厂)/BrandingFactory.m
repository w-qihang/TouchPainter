//
//  BrandingFactory.m
//  TouchPainter
//
//  Created by 汪启航 on 2019/7/24.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import "BrandingFactory.h"

@implementation BrandingFactory

+ (BrandingFactory *)factory {
#if defined USE_ACME
    return [[AcmeBrandingFactory alloc]init];
#elif defined USE_SIERRA
    return [[SierraBrandingFactory alloc]init];
#endif
    return nil;
}

- (UIView *)brandedView {
    return nil;
}
- (UIButton *)brandedMainButton {
    return nil;
}
- (UIToolbar *)brandedToolbar {
    return nil;
}

@end



@implementation AcmeBrandingFactory

- (UIView *)brandedView {
    return [[AcmeView alloc]init];
}
- (UIButton *)brandedMainButton {
    return [[AcmeMainButton alloc]init];
}
- (UIToolbar *)brandedToolbar {
    return [[AcmeToolbar alloc]init];
}

@end

@implementation AcmeView

@end

@implementation AcmeToolbar

@end

@implementation AcmeMainButton

@end



@implementation SierraBrandingFactory

- (UIView *)brandedView {
    return [[SierraView alloc]init];
}
- (UIButton *)brandedMainButton {
    return [[SierraMainButton alloc]init];
}
- (UIToolbar *)brandedToolbar {
    return [[SierraToolbar alloc]init];
}

@end


@implementation SierraView

@end

@implementation SierraToolbar

@end

@implementation SierraMainButton

@end
