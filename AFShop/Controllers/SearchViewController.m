//
//  SearchViewController.m
//  AFShop
//
//  Created by 飞 on 2018/9/11.
//  Copyright © 2018 飞. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController () <UISearchBarDelegate>
@property (nonatomic, strong)UISearchBar *searchBar;
@property (nonatomic, strong)UITextField *searchField;
@property (nonatomic, strong)UIButton *cancelBtn;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"搜索";
    self.view.backgroundColor = kColorGray;
    [self.navigationController.navigationBar setBarTintColor:kColorGray];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    UINavigationBar *currentBar = self.navigationController.navigationBar;
    [currentBar addSubview:self.searchBar];
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(currentBar.mas_safeAreaLayoutGuideLeft).offset(10);
        make.right.equalTo(currentBar.mas_safeAreaLayoutGuideRight).offset(0);
        make.top.equalTo(currentBar.mas_safeAreaLayoutGuideTop).offset(10);
        make.bottom.equalTo(currentBar.mas_safeAreaLayoutGuideBottom).offset(-10);
    }];
}

#pragma mark - UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    _cancelBtn.enabled = YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar endEditing:YES];
}
#pragma mark - getter and setter
- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [UISearchBar new];
        _searchBar.delegate = self;
        _searchBar.showsCancelButton = YES;
        _searchBar.placeholder = @"请输入你要搜索的宝贝";
        
        _searchField = [self.searchBar valueForKey:@"_searchField"];
        _searchField.textColor = kColorTextBlack;
        _searchField.font = [UIFont systemFontOfSize:14];
        _searchField.layer.cornerRadius = 15.f;
        _searchField.layer.masksToBounds = YES;
        
        _cancelBtn = [_searchBar valueForKeyPath:@"_cancelButton"];
        _cancelBtn.enabled = YES;
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:kColorTextBlack forState:UIControlStateNormal];
        _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _searchBar;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
