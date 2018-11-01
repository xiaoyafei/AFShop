//
//  ProductDetailViewController.m
//  AFShop
//
//  Created by 飞 on 2018/10/26.
//  Copyright © 2018 飞. All rights reserved.
//

#import "ProductDetailViewController.h"

#import "ProductDetailBannerTableViewCell.h"
#import "ProductDetailSepcificationsTableViewCell.h"
#import "ProductDetailPropertyTableViewCell.h"
#import "ProductDetailDescTableViewCell.h"
#import "ProductDetailBottomView.h"
//#import "WinePropertySelectView.h"
//#import "CartPostModel.h"
//#import "CartViewController.h"
//#import "ChateauDetailViewController.h"


@interface ProductDetailViewController ()<UITableViewDelegate, UITableViewDataSource, ProductDetailBottomViewDelegate, ProductDetailBannerTableViewCellDelegate>

@property (nonatomic, strong) UITableView *tableView;
//@property (nonatomic, strong) WineDetailModel *model;
//@property (nonatomic, assign) NSInteger currentBuyCount;
@property (nonatomic, strong) ProductDetailBottomView *bottomView;
//@property (nonatomic, strong) WinePropertySelectView *propertySelectView;

@end

@implementation ProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商品详情";    
    [self.view addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
        make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        make.height.mas_equalTo(@50);
    }];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.bottom.equalTo(self.bottomView.mas_top);
    }];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self requestData];
}

- (void)requestData {
}

- (void)backIndex:(UIButton *)sender {
    [AppDelegate sharedAppDelegate].rootViewController.selectedIndex = 0;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 2) {
        return 2;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        ProductDetailBannerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ProductDetailBannerTableViewCellIdentifier forIndexPath:indexPath];
        cell.delegate = self;
        return cell;
    }else if (indexPath.section == 1 && indexPath.row == 0){
        ProductDetailSepcificationsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ProductDetailSepcificationsTableViewCellIdentifier forIndexPath:indexPath];
        cell.sepcificationsLab.text = [NSString stringWithFormat:@"已选规格：%@,%@,%@",@"宽松版",@"小号",@"1件"];
        return cell;
    }else if (indexPath.section == 2){
        ProductDetailPropertyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ProductDetailPropertyTableViewCellIdentifier forIndexPath:indexPath];
        cell.key1Lab.text = @"型号";
        cell.value1Lab.text = @"宽松版";
        cell.key2Lab.text = @"大小";
        cell.value2Lab.text = @"小号";
        return cell;
    }else if (indexPath.section == 3){
        ProductDetailDescTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ProductDetailDescTableViewCellIdentifier forIndexPath:indexPath];
        cell.desLab.text = @"健身房看见爱上对方空间暗红色的咖啡机哈盛开的激发哈克龙设计的鸿福路口";
        return cell;
    }
    return [UITableViewCell new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 363;
    }else if (indexPath.section == 1 && indexPath.row == 0){
        return 50;
    }else if (indexPath.section == 2) {
        return 35;
    }else if (indexPath.section == 3){
        return 120;
    }
    else {
        return 0.01;
    }
}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.section == 1 && indexPath.row == 0) {
//        _propertySelectView = [[WinePropertySelectView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//        _propertySelectView.delegate = self;
//        [_propertySelectView bindData:_model];
//        [[AppDelegate sharedAppDelegate].window addSubview:_propertySelectView];
//    }
//}
//
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return [UIView new];
    }
    UIView *separtorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 10)];
    separtorView.backgroundColor = RGBCOLOR(242, 242, 242);
//    UIView *topLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
//    topLineView.backgroundColor = RGBCOLOR(229, 229, 229);
//    [separtorView addSubview:topLineView];
//    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 9, kScreenWidth, 1)];
//    bottomView.backgroundColor = RGBCOLOR(229, 229, 229);
//    [separtorView addSubview:bottomView];
    return separtorView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.001;
    }
    return 10;
}

#pragma mark - CustomDelegate
//- (void)WinePropertySelectView:(WinePropertySelectView *)sender clickTag:(NSInteger)index {
//    if (index == 1) {
//        if (_currentBuyCount > _model.MinQtyPerOrder) {
//            _currentBuyCount -= _model.IncreaseCount;
//            sender.buyCount.text = @(_currentBuyCount).stringValue;
//        }else {
//            [self showMessage:[NSString stringWithFormat:@"最少购买%ld件商品",_model.MinQtyPerOrder]];
//        }
//    }else if (index == 2){
//        if (_currentBuyCount < _model.MaxQtyPerOrder) {
//            _currentBuyCount += _model.IncreaseCount;
//            sender.buyCount.text = @(_currentBuyCount).stringValue;
//        }else {
//            [self showMessage:[NSString stringWithFormat:@"最多购买%ld件商品",_model.MinQtyPerOrder]];
//        }
//    }else if (index == 3){
//        CartPostModel *postModel = [CartPostModel new];
//        postModel.ProductSysNo = _model.SysNo;
//        postModel.VendorSysNo = _model.VendorSysNo;
//        postModel.ProductQty = _currentBuyCount;
//        postModel.IsSelected = YES;
//        NSMutableArray *batchModel = [NSMutableArray arrayWithObjects:postModel, nil];
//        BaseJsonRequest *request = [[BaseJsonRequest alloc] initWithRequestMethod:YTKRequestMethodPOST url:@"Cart/BatchAddCart" argument:[batchModel yy_modelToJSONObject]];
//        [request startWithSuccessBlock:^(BaseModel *responModel) {
//            [self showMessage:@"添加成功"];
//            [sender removeFromSuperview];
//        } failureBlock:^(NSString *errorMessage) {
//            [self showMessage:errorMessage];
//            [sender removeFromSuperview];
//        }];
//    }else {
//        [sender removeFromSuperview];
//    }
//}

//- (void)WinePropertySelectView:(WinePropertySelectView *)sender clickProperty:(Firstproperty *)selectedProperty {
//    _sysNo = selectedProperty.ProductSysNo;
//    [self requestData];
//}
//
- (void)productDetailBottomView:(ProductDetailBottomView *)sender index:(NSInteger)index {
    //跳转购物车
    if (index == 2) {
        [[AppDelegate sharedAppDelegate].rootViewController setSelectedIndex:2];
        [self.navigationController popToRootViewControllerAnimated:YES];

    }
    //加入购物车
    else if (index == 1) {
//        CartPostModel *postModel = [CartPostModel new];
//        postModel.ProductSysNo = _model.SysNo;
//        postModel.VendorSysNo = _model.VendorSysNo;
//        postModel.ProductQty = _currentBuyCount;
//        postModel.IsSelected = YES;
//        NSMutableArray *batchModel = [NSMutableArray arrayWithObjects:postModel, nil];
//        BaseJsonRequest *request = [[BaseJsonRequest alloc] initWithRequestMethod:YTKRequestMethodPOST url:@"Cart/BatchAddCart" argument:[batchModel yy_modelToJSONObject]];
//        [request startWithSuccessBlock:^(BaseModel *responModel) {
//            [self showMessage:@"添加成功"];
//        } failureBlock:^(NSString *errorMessage) {
//            [self showMessage:errorMessage];
//        }];
    }
    //立即购买
    else if (index == 0) {

    }

}

- (void)productDetailBannerTableViewCell:(ProductDetailBannerTableViewCell *)sender {
//    ChateauDetailViewController *vc = [ChateauDetailViewController new];
//    vc.storeSysNo = _model.StoreSysNo;
//    [self pushToViewController:vc animated:YES];
}

#pragma mark - getter && setter
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        [_tableView registerClass:[ProductDetailBannerTableViewCell class] forCellReuseIdentifier:ProductDetailBannerTableViewCellIdentifier];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ProductDetailSepcificationsTableViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:ProductDetailSepcificationsTableViewCellIdentifier];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ProductDetailPropertyTableViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:ProductDetailPropertyTableViewCellIdentifier];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ProductDetailDescTableViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:ProductDetailDescTableViewCellIdentifier];
    }
    return _tableView;
}

- (ProductDetailBottomView *)bottomView {
    if (_bottomView == nil) {
        _bottomView = [[NSBundle mainBundle] loadNibNamed:@"ProductDetailBottomView" owner:self options:nil].firstObject;
        _bottomView.delegate = self;
    }
    return _bottomView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
