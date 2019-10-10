//
// Created by yun on 2017/5/11.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunAppTheme+Font.h"

@implementation YunAppTheme (Font)

+ (UIFont *)fontL_S {
    return [UIFont fontWithName:YunAppTheme.instance.fontLName size:YunAppTheme.instance.sizeS];
}

+ (UIFont *)fontN_S {
    return [UIFont fontWithName:YunAppTheme.instance.fontNName size:YunAppTheme.instance.sizeS];
}

+ (UIFont *)fontM_S {
    return [UIFont fontWithName:YunAppTheme.instance.fontMName size:YunAppTheme.instance.sizeS];
}

+ (UIFont *)fontB_S {
    return [UIFont fontWithName:YunAppTheme.instance.fontBName size:YunAppTheme.instance.sizeS];
}

+ (UIFont *)fontL_N {
    return [UIFont fontWithName:YunAppTheme.instance.fontLName size:YunAppTheme.instance.sizeN];
}

+ (UIFont *)fontN_N {
    return [UIFont fontWithName:YunAppTheme.instance.fontNName size:YunAppTheme.instance.sizeN];
}

+ (UIFont *)fontM_N {
    return [UIFont fontWithName:YunAppTheme.instance.fontMName size:YunAppTheme.instance.sizeN];
}

+ (UIFont *)fontB_N {
    return [UIFont fontWithName:YunAppTheme.instance.fontBName size:YunAppTheme.instance.sizeN];
}

+ (UIFont *)fontL_L {
    return [UIFont fontWithName:YunAppTheme.instance.fontLName size:YunAppTheme.instance.sizeL];
}

+ (UIFont *)fontN_L {
    return [UIFont fontWithName:YunAppTheme.instance.fontNName size:YunAppTheme.instance.sizeL];
}

+ (UIFont *)fontM_L {
    return [UIFont fontWithName:YunAppTheme.instance.fontMName size:YunAppTheme.instance.sizeL];
}

+ (UIFont *)fontB_L {
    return [UIFont fontWithName:YunAppTheme.instance.fontBName size:YunAppTheme.instance.sizeL];
}

+ (UIFont *)fontL_B {
    return [UIFont fontWithName:YunAppTheme.instance.fontLName size:YunAppTheme.instance.sizeB];
}

+ (UIFont *)fontN_B {
    return [UIFont fontWithName:YunAppTheme.instance.fontNName size:YunAppTheme.instance.sizeB];
}

+ (UIFont *)fontM_B {
    return [UIFont fontWithName:YunAppTheme.instance.fontMName size:YunAppTheme.instance.sizeB];
}

+ (UIFont *)fontB_B {
    return [UIFont fontWithName:YunAppTheme.instance.fontBName size:YunAppTheme.instance.sizeB];
}


+ (UIFont *)fontL:(CGFloat)size {
    return [UIFont fontWithName:YunAppTheme.instance.fontLName size:[YunAppTheme.instance sSize:size]];
}

+ (UIFont *)fontN:(CGFloat)size {
    return [UIFont fontWithName:YunAppTheme.instance.fontNName size:[YunAppTheme.instance sSize:size]];
}

+ (UIFont *)fontM:(CGFloat)size {
    return [UIFont fontWithName:YunAppTheme.instance.fontMName size:[YunAppTheme.instance sSize:size]];
}

+ (UIFont *)fontB:(CGFloat)size {
    return [UIFont fontWithName:YunAppTheme.instance.fontBName size:[YunAppTheme.instance sSize:size]];
}

// 不缩放
+ (UIFont *)nagFontTitle {
    return [UIFont fontWithName:YunAppTheme.instance.fontNagTitle size:YunAppTheme.instance.sizeNagTitle];
}

// 不缩放
+ (UIFont *)nagFontItem {
    return [UIFont fontWithName:YunAppTheme.instance.fontNagItem size:YunAppTheme.instance.sizeNagItem];
}

@end
