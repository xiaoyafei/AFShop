//
//  ViewController.m
//  AFShop
//
//  Created by 飞 on 2018/9/5.
//  Copyright © 2018 飞. All rights reserved.
//

#import "RootViewController.h"
#import "LoginViewController.h"
#import "HomeViewController.h"
#import "SearchViewController.h"
#import "MineViewController.h"
#import "CartViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:[[HomeViewController alloc] init]];
    UINavigationController *searchNav = [[UINavigationController alloc] initWithRootViewController:[[SearchViewController alloc] init]];
    UINavigationController *cartNav = [[UINavigationController alloc] initWithRootViewController:[[CartViewController alloc] init]];
    UINavigationController *mineNav = [[UINavigationController alloc] initWithRootViewController:[[MineViewController alloc] init]];
    self.viewControllers = @[homeNav, searchNav, cartNav, mineNav];
    NSArray *titles = @[@"首页", @"搜索", @"购物车", @"我"];
    NSArray *images = @[@"tabbar_home",@"tabbar_search",@"tabbar_cart",@"tabbar_mine"];
    [self.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
        [item setTitle:titles[idx]];
        item.image = [[UIImage imageNamed:[images[idx] stringByAppendingString:@"_normal"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.selectedImage = [[UIImage imageNamed:images[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : kColorGreen} forState:UIControlStateSelected];
}

#pragma mark - delegate
#pragma mark - event response
#pragma mark - private methods
#pragma mark - getter and setter
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
