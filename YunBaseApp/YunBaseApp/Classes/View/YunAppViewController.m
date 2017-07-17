//
//  Created by 王健 on 16/8/25.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunAppViewController.h"

@interface YunAppViewController () {
}

@end

@implementation YunAppViewController

- (instancetype)init {
    self = [super init];

    if (self) {
        _updateItem = YES;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = YunAppTheme.colorVcBg;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    if (!self.hideNagBar) {
        // 导航栏背景颜色
        [self setNagBg:YunAppTheme.colorNagBg];

        // title 字体
        [self setNagTitle:YunAppTheme.colorNagDark font:YunAppTheme.nagFontTitle];

        if (_updateItem) {
            // 返回item
            self.navigationItem.leftBarButtonItem = self.hideNagBarBackItem ? nil : self.leftNagItem;

            // right item
            self.navigationItem.rightBarButtonItem = self.rightNagItem;
        }
        else {
            if (!self.hideNagBarBackItem) {
                self.navigationItem.leftBarButtonItem = self.leftNagItem;
            }
        }
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

#pragma mark - handles

#pragma mark - public functions

- (void)setNagBg:(UIColor *)color {
    // 导航栏背景颜色
    [self.navigationController.navigationBar setBarTintColor:color];
}

- (void)setNagTitle:(UIColor *)color font:(UIFont *)font {
    // title 字体
    [self.navigationController.navigationBar setTitleTextAttributes:@{
            NSFontAttributeName            : font,
            NSForegroundColorAttributeName : color
    }];
}

- (void)setRightBarItemName:(NSString *)name color:(UIColor *)color {
    [self setRightBarItemName:name
                         font:[YunAppTheme nagFontItem]
                        color:color == nil ? YunAppTheme.colorNagDark : color];

    self.rightNagItem = self.navigationItem.rightBarButtonItem;
}

- (void)setRightBarItemName:(NSString *)name {
    [self setRightBarItemName:name color:nil];
}

- (void)setLeftBarItemName:(NSString *)name color:(UIColor *)color {
    [self setLeftBarItemName:name
                        font:[YunAppTheme nagFontItem]
                       color:color == nil ? YunAppTheme.colorNagDark : color];

    self.leftNagItem = self.navigationItem.leftBarButtonItem;
}

- (void)setLeftBarItemName:(NSString *)name {
    [self setLeftBarItemName:name color:nil];
}

- (void)setLeftBarItemBtn:(UIBarButtonItem *)btn {
    self.navigationItem.leftBarButtonItem = btn;

    self.leftNagItem = self.navigationItem.leftBarButtonItem;
}

- (void)setRightBarItemBtn:(UIBarButtonItem *)btn {
    self.navigationItem.rightBarButtonItem = btn;

    self.rightNagItem = self.navigationItem.rightBarButtonItem;
}

- (void)setNavTitle:(NSString *)title {
    self.navigationItem.title = title;
}

#pragma mark - private functions

#pragma mark - protocol

#pragma mark - request functions

- (void)rqtDataFromServer {
}

- (void)updateVcData {
}

@end
