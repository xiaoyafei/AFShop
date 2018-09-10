//
//  LoginViewController.m
//  AFShop
//
//  Created by 飞 on 2018/9/6.
//  Copyright © 2018 飞. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginInputCell.h"

@interface LoginViewController ()
@property(nonatomic, strong) NSString *phoneNumber;
@property(nonatomic, strong) NSString *password;

@property(nonatomic, strong) TPKeyboardAvoidingTableView *tableView;
@end

@implementation LoginViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.tableView.tableHeaderView = [self customHeaderView];
    self.tableView.tableFooterView = [self customFooterView];
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LoginInputCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier_Login_Input_Cell forIndexPath:indexPath];
    __weak typeof(self) weakSelf = self;
    if (indexPath.row == 0) {
        [cell setInputType:InputTypeNormal];
        cell.editDidBeginBlock = ^(NSString *text) {
            weakSelf.phoneNumber = text;
        };
        cell.textValueChangedBlock = ^(NSString *text) {
            weakSelf.phoneNumber = text;
        };
        cell.editDidBeginBlock = ^(NSString *text) {
            weakSelf.phoneNumber = text;
        };
    }else {
        [cell setInputType:InputTypeSecure];
        cell.editDidBeginBlock = ^(NSString *text) {
            weakSelf.password = text;
        };
        cell.textValueChangedBlock = ^(NSString *text) {
            weakSelf.password = text;
        };
        cell.editDidBeginBlock = ^(NSString *text) {
            weakSelf.password = text;
        };
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65.f;
}

#pragma mark - CustomDelegate

#pragma mark - event response
- (void)didTappedSubmitButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - private methods

#pragma mark - getters and setters
- (TPKeyboardAvoidingTableView *)tableView {
    if (!_tableView) {
        _tableView = [[TPKeyboardAvoidingTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[LoginInputCell class] forCellReuseIdentifier:kCellIdentifier_Login_Input_Cell];
    }
    return _tableView;
}

- (UIView *)customHeaderView {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 120)];
    UILabel *headerLabel = [UILabel new];
    headerLabel.text = @"登陆";
    headerLabel.font = [UIFont systemFontOfSize:30.f];
    headerLabel.textColor = kColorGreen;
    [headerView addSubview:headerLabel];
    [headerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headerView).offset(kLoginPadding);
        make.bottom.equalTo(headerView);
        make.height.mas_equalTo(42);
    }];
    return headerView;
}

- (UIView *)customFooterView {
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
    UIButton *submitButton = [UIButton new];
    [submitButton setTitle:@"登陆" forState:UIControlStateNormal];
    submitButton.titleLabel.font = [UIFont systemFontOfSize:17.f];
    [submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    submitButton.backgroundColor = kColorGreen;
    [submitButton addTarget:self action:@selector(didTappedSubmitButton:) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:submitButton];
    [submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(footerView).offset(kLoginPadding);
        make.right.equalTo(footerView).offset(-kLoginPadding);
        make.height.mas_equalTo(60.f);
        make.bottom.equalTo(footerView);
    }];
    return footerView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
