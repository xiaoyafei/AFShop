//
//  SearchViewController.m
//  AFShop
//
//  Created by 飞 on 2018/9/11.
//  Copyright © 2018 飞. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchTagCollectionViewCell.h"
#import "SearchHeaderCollectionReusableView.h"
#import "LeftAlignFlowLayout.h"

@interface SearchViewController () <UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong)UISearchBar *searchBar;
@property (nonatomic, strong)UITextField *searchField;
@property (nonatomic, strong)UIButton *cancelBtn;
@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong)NSMutableArray *tagTextArray;
@property (nonatomic, strong)NSMutableArray *recommendArray;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"搜索";
    self.view.backgroundColor = [UIColor whiteColor];
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
    
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    _tagTextArray = [NSMutableArray arrayWithArray:@[@"肖步渠", @"洗衣机洗碗机", @"服装西服T恤额", @"微微一笑很青春"]];
    _recommendArray = [NSMutableArray arrayWithArray:@[@"牛仔裤",@"川妹子袜子",@"四川辣妹子牌洗碗机草鸡空当接龙开发简单来",@"洗衣机"]];
}

#pragma mark - UICollectionViewDelegate & DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return _tagTextArray.count;
    }else{
        return _recommendArray.count;
    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SearchTagCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:SearchTagCellIdentifier forIndexPath:indexPath];
    if (indexPath.section == 0) {
        cell.tagLabel.text = [_tagTextArray objectAtIndex:indexPath.row];
    }else{
        cell.tagLabel.text = [_recommendArray objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width;
    if(indexPath.section == 0){
        width = [[_tagTextArray objectAtIndex:indexPath.row] widthWithFont:[UIFont systemFontOfSize:14]];
    }else{
        width = [[_recommendArray objectAtIndex:indexPath.row] widthWithFont:[UIFont systemFontOfSize:14]];
    }
    width = width > (kScreenWidth - 2 * kTagTextPadding - 20) ? (kScreenWidth - 2 * kTagTextPadding - 20) : width;
    return CGSizeMake(width + 2 * kTagTextPadding, 30);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    SearchHeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:SearchHeaderIdentifier forIndexPath:indexPath];
    if (indexPath.section == 0) {
        headerView.title.text = @"历史记录";
        [headerView.button setImage:[UIImage imageNamed:@"ic_delete"] forState:UIControlStateNormal];
        __weak typeof(self) weakSelf = self;
        headerView.buttonTappedBlock = ^(id sender) {
            [weakSelf.tagTextArray removeAllObjects];
            [weakSelf.collectionView reloadData];
        };
    }else {
        headerView.title.text = @"热门搜索";
        [headerView.button setImage:[UIImage imageNamed:@"ic_eye"] forState:UIControlStateNormal];
        __weak typeof(self) weakSelf = self;
        headerView.buttonTappedBlock = ^(id sender) {
            [weakSelf.recommendArray removeAllObjects];
            [weakSelf.collectionView reloadData];
        };
    }
    return headerView;
}

#pragma mark - UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    _cancelBtn.enabled = YES;
    if (searchBar.text && searchBar.text.length > 0) {
        [_tagTextArray insertObject:searchBar.text atIndex:0];
        [_collectionView reloadData];
    }
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

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        LeftAlignFlowLayout *flowLayout = [LeftAlignFlowLayout new];
        flowLayout.itemSize = CGSizeMake(100, 30);
        flowLayout.minimumLineSpacing = 10.f;
        flowLayout.minimumInteritemSpacing = 10.f;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        flowLayout.headerReferenceSize = CGSizeMake(kScreenWidth, 30);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = kColorGray;
        [_collectionView registerClass:[SearchTagCollectionViewCell class] forCellWithReuseIdentifier:SearchTagCellIdentifier];
        [_collectionView registerClass:[SearchHeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:SearchHeaderIdentifier];
    }
    return _collectionView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
