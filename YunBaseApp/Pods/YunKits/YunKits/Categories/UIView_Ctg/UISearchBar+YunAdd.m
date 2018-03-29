//
// Created by yun on 16/9/18.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "UISearchBar+YunAdd.h"
#import "UIImage+YunAdd.h"

@implementation UISearchBar (YunAdd)

- (void)setIconByImgName:(NSString *)imgName {
    [self setImage:[UIImage imageNamed:imgName]
  forSearchBarIcon:UISearchBarIconSearch
             state:UIControlStateNormal];
}

- (void)setRadius:(CGFloat)rd bgColor:(UIColor *)bgColor {
    [self setRadius:rd bgColor:bgColor borderColor:nil borderWidth:0];
}

- (void)setRadius:(CGFloat)rd
          bgColor:(UIColor *)bgColor
      borderColor:(UIColor *)borderColor
      borderWidth:(CGFloat)borderWidth {
    UITextField *searchField = [self valueForKey:@"searchField"];

    if (searchField) {
        [searchField setBackgroundColor:bgColor];
        searchField.layer.cornerRadius = rd;
        searchField.layer.borderColor = borderColor.CGColor;
        searchField.layer.borderWidth = borderWidth;
        searchField.layer.masksToBounds = YES;
    }
}

- (void)setBg:(UIColor *)color {
    /** 设置背景图片 */
    UIImage *searchBarBg = [UIImage imgWithColor:color];
    [self setBackgroundImage:searchBarBg];   //这里图片的颜色和导航栏一样

    /** 设置背景色 */
    [self setBackgroundColor:color];
}

- (void)setBg:(UIColor *)color height:(CGFloat)height {
    /** 设置背景图片 */
    UIImage *searchBarBg = [UIImage imgWithColor:color height:height];
    [self setBackgroundImage:searchBarBg];   //这里图片的颜色和导航栏一样

    /** 设置背景色 */
    [self setBackgroundColor:color];

    // 设置文本框背景
    //UIImage *searchFBarBg = [UIImage GetImageWithColor:fColor andHeight:height];
    //[self setSearchFieldBackgroundImage:searchFBarBg forState:UIControlStateNormal];
}

- (void)setBg:(UIColor *)color height:(CGFloat)height filedBgImg:(NSString *)img {
    /** 设置背景图片 */
    UIImage *searchBarBg = [UIImage imgWithColor:color height:height];
    [self setBackgroundImage:searchBarBg];   //这里图片的颜色和导航栏一样

    /** 设置背景色 */
    [self setBackgroundColor:color];

    // 设置文本框背景
    UIImage *searchFBarBg = [UIImage imageNamed:img];
    [self setSearchFieldBackgroundImage:searchFBarBg forState:UIControlStateNormal];
}

- (UIView *)schBgView {
    UIView *backgroundView = [self valueForKey:@"_background"];
    if (backgroundView) {
        return backgroundView;
    }

    for (UIView *v1 in self.subviews) {
        for (id v2 in v1.subviews) {
            if ([v2 isKindOfClass:UIView.class] && ![v2 isKindOfClass:UITextField.class]) {
                UIView *bg = v2;
                return bg;
            }
        }
    }

    return nil;
}

- (UITextField *)schTfView {
    UITextField *searchField = [self valueForKey:@"_searchField"];
    if (searchField) {
        return searchField;
    }

    for (UIView *v1 in self.subviews) {
        for (id v2 in v1.subviews) {
            if ([v2 isKindOfClass:UITextField.class]) {
                UITextField *tf = v2;
                return tf;
            }
        }
    }

    return nil;
}

@end