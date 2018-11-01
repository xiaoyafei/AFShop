//
//  ProductDetailBannerTableViewCell.h
//  WineMarket
//
//  Created by 肖遥 on 2017/12/11.
//  Copyright © 2017年 XiaoYaFei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
static NSString *const ProductDetailBannerTableViewCellIdentifier = @"ProductDetailBannerTableViewCellIdentifier";
@class ProductDetailBannerTableViewCell;
@protocol ProductDetailBannerTableViewCellDelegate <NSObject>

- (void)productDetailBannerTableViewCell:(ProductDetailBannerTableViewCell *)sender;

@end

@interface ProductDetailBannerTableViewCell : UITableViewCell

@property (nonatomic, strong)SDCycleScrollView *bannerImg;
@property (nonatomic, strong)UILabel *tagLabel;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIImageView *chateauIcon;
@property (nonatomic, strong)UILabel *chateauName;
@property (nonatomic, strong)UILabel *priceLab;
@property (nonatomic, assign)id<ProductDetailBannerTableViewCellDelegate> delegate;
//- (void)bindData:(WineDetailModel *)model;

@end
