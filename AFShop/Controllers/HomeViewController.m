//
//  HomeViewController.m
//  AFShop
//
//  Created by 飞 on 2018/9/11.
//  Copyright © 2018 飞. All rights reserved.
//

#import "HomeViewController.h"
#import "SearchViewController.h"

@interface HomeViewController ()
@property (nonatomic, strong)UIView *searchView;
@property (nonatomic, strong)UIButton *searchButton;
@property (nonatomic, strong)UICollectionView *collectionView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setBarTintColor:kColorGreen];
    [self.navigationController.navigationBar addSubview:self.searchView];
    [self.searchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navigationController.navigationBar);
        make.left.equalTo(self.navigationController.navigationBar.mas_safeAreaLayoutGuideLeft).offset(10);
        make.right.equalTo(self.navigationController.navigationBar.mas_safeAreaLayoutGuideRight).offset(-10);
        make.bottom.equalTo(self.navigationController.navigationBar);
    }];
    
    [self.searchView addSubview:self.searchButton];
    [self.searchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.searchView);
        make.top.equalTo(self.searchView).offset(5);
        make.bottom.equalTo(self.searchView).offset(-5);
    }];
}

#pragma mark - event response
- (void)didTappedSearchButton:(id)sender {
    
}

#pragma mark - getter and setter
- (UIView *)searchView {
    if (!_searchView) {
        _searchView = [UIView new];
        _searchView.backgroundColor = [UIColor clearColor];
    }
    return _searchView;
}

- (UIView *)searchButton {
    if (!_searchButton) {
        _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_searchButton setTitle:@"输入你要找的宝贝" forState:UIControlStateNormal];
        [_searchButton setTitleColor:[UIColor colorWithHexString:@"707070"] forState:UIControlStateNormal];
        [_searchButton setImage:[UIImage imageNamed:@"ic_search"] forState:UIControlStateNormal];
        _searchButton.backgroundColor = [UIColor whiteColor];
        _searchButton.titleLabel.font = [UIFont systemFontOfSize:12];
        _searchButton.layer.cornerRadius = 6.f;
        _searchButton.layer.masksToBounds = YES;
        [_searchButton addTarget:self action:@selector(didTappedSearchButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _searchButton;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.itemSize = CGSizeMake(100, 30);
        flowLayout.minimumLineSpacing = 10.f;
        flowLayout.minimumInteritemSpacing = 5.f;
        flowLayout.sectionInset = UIEdgeInsetsZero;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
