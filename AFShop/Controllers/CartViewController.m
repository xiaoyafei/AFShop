//
//  CartViewController.m
//  AFShop
//
//  Created by 飞 on 2018/9/11.
//  Copyright © 2018 飞. All rights reserved.
//

#import "CartViewController.h"

@interface CartViewController ()
@property (nonatomic, strong)UIView *emptyView;
@end

@implementation CartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"购物车";
    self.view.backgroundColor = [UIColor whiteColor];
    _emptyView = [UIView emptyViewWithFrame:self.view.frame andText:@"购物车什么也没有"];
    [self.view addSubview:_emptyView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
