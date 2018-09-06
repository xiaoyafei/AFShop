//
//  ViewController.m
//  AFShop
//
//  Created by 飞 on 2018/9/5.
//  Copyright © 2018 飞. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"

@interface ViewController ()

@property(nonatomic, strong)UIButton *loginButton;

@end

@implementation ViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.loginButton];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.centerY.equalTo(self.view);
        make.height.mas_equalTo(60.f);
    }];
}

#pragma mark - delegate

#pragma mark - event response
- (void)didTappedLoginButton:(UIButton *)loginButton {
    LoginViewController *loginViewController = [[LoginViewController alloc] init];
    [self presentViewController:loginViewController animated:YES completion:nil];
}

#pragma mark - private methods

#pragma mark - getter and setter
- (UIButton *)loginButton {
    if (!_loginButton) {
        _loginButton = [UIButton new];
        [_loginButton setTitle:@"登陆" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(didTappedLoginButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
