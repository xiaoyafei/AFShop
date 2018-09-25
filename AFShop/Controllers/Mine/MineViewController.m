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
#import <MobileCoreServices/MobileCoreServices.h>

@interface MineViewController ()<UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) UIImageView *avatarImg;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UIImage *avatar;

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
        orderListVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:orderListVC animated:YES];
    }
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    _avatar = info[UIImagePickerControllerEditedImage];
    _avatarImg.image = _avatar;
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - response event
- (void)didTappedAvatarImg:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"选择操作" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            UIAlertController *alertCamera = [UIAlertController alertControllerWithTitle:@"错误" message:@"相机不可用" preferredStyle:UIAlertControllerStyleAlert];
            [alertCamera addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                return ;
            }]];
            [self presentViewController:alertCamera animated:YES completion:nil];
        }
        else{
            UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
            imagePickerController.delegate = self;
            imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            imagePickerController.allowsEditing = YES;
            imagePickerController.showsCameraControls = YES;
            imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceRear;
            imagePickerController.mediaTypes = @[(NSString *)kUTTypeImage];
            
            [self presentViewController:imagePickerController animated:YES completion:nil];
        }
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePickerController.allowsEditing = YES;
        imagePickerController.mediaTypes = @[(NSString *)kUTTypeImage];
        
        [self presentViewController:imagePickerController animated:YES completion:nil];
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        return ;
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
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
    _avatarImg.userInteractionEnabled = YES;
    UITapGestureRecognizer *avatarTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTappedAvatarImg:)];
    [_avatarImg addGestureRecognizer:avatarTap];
    [headerView addSubview:_avatarImg];
    [_avatarImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(headerView);
        make.size.mas_equalTo(CGSizeMake(64, 64));
    }];
    
    _name = [UILabel new];
    _name.text = @"iOS阿飞";
    _name.font = [UIFont systemFontOfSize:14];
    _name.textColor = [UIColor whiteColor];
    [headerView addSubview:_name];
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.avatarImg.mas_bottom).offset(10);
        make.centerX.equalTo(headerView);
    }];
    
    return headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
