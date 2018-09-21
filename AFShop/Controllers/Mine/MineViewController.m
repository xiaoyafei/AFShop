//
//  MineViewController.m
//  AFShop
//
//  Created by 飞 on 2018/9/11.
//  Copyright © 2018 飞. All rights reserved.
//

#import "MineViewController.h"
#import "MineTableViewCell.h"
#import "OrderListViewController.h"

@interface MineViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) UIImageView *avatarImg;
@property (nonatomic, strong) UILabel *name;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    self.tableView.tableHeaderView = [self customHeaderView];
    _titles = @[@"我的订单", @"我的地址"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
//    UIEdgeInsets inset = self.tableView.contentInset;
//    inset.top = - kTopHeight;
//    [self.tableView setContentInset:inset];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier_Mine_Cell forIndexPath:indexPath];
    cell.title.text = _titles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        OrderListViewController *orderListVC = [[OrderListViewController alloc] init];
        [self.navigationController pushViewController:orderListVC animated:YES];
    }
}

#pragma mark - getter & setter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.rowHeight = 44.f;
        [_tableView registerClass:[MineTableViewCell class] forCellReuseIdentifier:kCellIdentifier_Mine_Cell];
    }
    return _tableView;
}

- (UIView *)customHeaderView {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 180)];
    headerView.backgroundColor = kColorGreen;
    _avatarImg = [UIImageView new];
    _avatarImg.image = [UIImage imageNamed:@"avatar_default"];
    _avatarImg.layer.cornerRadius = 32.f;
    _avatarImg.layer.masksToBounds = YES;
    _avatarImg.layer.borderColor = [UIColor whiteColor].CGColor;
    _avatarImg.layer.borderWidth = 2.f;
    [headerView addSubview:_avatarImg];
    [_avatarImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(headerView);
        make.size.mas_equalTo(CGSizeMake(64, 64));
    }];
    
    _name = [UILabel new];
    
    return headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
