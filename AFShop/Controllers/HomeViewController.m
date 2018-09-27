//
//  HomeViewController.m
//  AFShop
//
//  Created by 飞 on 2018/9/11.
//  Copyright © 2018 飞. All rights reserved.
//

#import "HomeViewController.h"
#import "SearchViewController.h"
#import "HomeCollectionViewCell.h"
#import "HomeBannerCollectionReusableView.h"
#import "AppDelegate.h"

@interface HomeViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong)UIView *searchView;
@property (nonatomic, strong)UIButton *searchButton;
@property (nonatomic, strong)UICollectionView *collectionView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kColorGray;
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
    
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier_Home_Cell forIndexPath:indexPath];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    HomeBannerCollectionReusableView *reuseableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kCellIdentifier_Home_Header_cell forIndexPath:indexPath];
    reuseableView.cycleScrollView.imageURLStringsGroup = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1537960056841&di=ff9d2609223bd92c4fc432fc315b8f26&imgtype=0&src=http%3A%2F%2Fimg4.duitang.com%2Fuploads%2Fitem%2F201405%2F31%2F20140531110858_VCuKK.jpeg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1537960056839&di=6646be88d5e2a789ae4a9119ef969a67&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201210%2F14%2F20121014191444_TtS8e.thumb.700_0.jpeg"];
    return reuseableView;
}

#pragma mark - event response
- (void)didTappedSearchButton:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelegate.rootViewController.selectedIndex = 1;
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
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 0, 10);
        flowLayout.itemSize = CGSizeMake((kScreenWidth - 30) / 2.0, 300);
        flowLayout.headerReferenceSize = CGSizeMake(kScreenWidth, 150);
        flowLayout.minimumLineSpacing = 10;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[HomeCollectionViewCell class] forCellWithReuseIdentifier:kCellIdentifier_Home_Cell];
        [_collectionView registerClass:[HomeBannerCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kCellIdentifier_Home_Header_cell];
    }
    return _collectionView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
