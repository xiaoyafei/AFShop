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
#import "Product.h"
#import "ProductDetailViewController.h"

@interface HomeViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UIView *searchView;
@property (nonatomic, strong) UIButton *searchButton;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kColorGray;
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    _dataSource = [NSMutableArray new];
    [self createProductTable];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
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

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.searchView removeFromSuperview];
}

#pragma mark - FMDB
- (void)createProductTable {
    Product *testProduct = [[Product alloc] init];
    testProduct.ProductName = @"竹节水电T恤";
    testProduct.ProductDesc = @"无印良品";
    testProduct.CurrentPrice = 58.2f;
    testProduct.OriginPrice = 68.9f;
    testProduct.Count = 10;
    testProduct.Status = ProductStatusNormal;
    testProduct.ImageUrl = @"E371ACC2-4E91-4270-A660-2E73FBC8E93A.jpeg";

//    [[JQFMDB shareDatabase] jq_createTable:kProductTableName dicOrModel:[Product class]];
//    [[JQFMDB shareDatabase] jq_insertTable:kProductTableName dicOrModel:testProduct];
    NSArray *products = [[JQFMDB shareDatabase] jq_lookupTable:kProductTableName dicOrModel:[Product class] whereFormat:nil];
    [_dataSource addObjectsFromArray:products];
}

#pragma mark - UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HomeCellIdentifier forIndexPath:indexPath];
    Product *product = [_dataSource objectAtIndex:indexPath.row];
    cell.title.text = product.ProductName;
    cell.desc.text = product.ProductDesc;
    cell.price.text = [NSString stringWithFormat:@"%.2f", product.CurrentPrice];
    cell.original.text = [NSString stringWithFormat:@"%.2f", product.OriginPrice];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    HomeBannerCollectionReusableView *reuseableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HomeHeaderCellIdentifier forIndexPath:indexPath];
    reuseableView.cycleScrollView.imageURLStringsGroup = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1537960056841&di=ff9d2609223bd92c4fc432fc315b8f26&imgtype=0&src=http%3A%2F%2Fimg4.duitang.com%2Fuploads%2Fitem%2F201405%2F31%2F20140531110858_VCuKK.jpeg", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1537960056839&di=6646be88d5e2a789ae4a9119ef969a67&imgtype=0&src=http%3A%2F%2Fimg5.duitang.com%2Fuploads%2Fitem%2F201210%2F14%2F20121014191444_TtS8e.thumb.700_0.jpeg"];
    return reuseableView;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ProductDetailViewController *detailVC = [[ProductDetailViewController alloc] init];
    detailVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
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
        [_collectionView registerClass:[HomeCollectionViewCell class] forCellWithReuseIdentifier:HomeCellIdentifier];
        [_collectionView registerClass:[HomeBannerCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HomeHeaderCellIdentifier];
    }
    return _collectionView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
