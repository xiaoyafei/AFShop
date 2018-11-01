//
//  ProductDetailBannerTableViewCell.m
//  WineMarket
//
//  Created by 肖遥 on 2017/12/11.
//  Copyright © 2017年 XiaoYaFei. All rights reserved.
//

#import "ProductDetailBannerTableViewCell.h"

@implementation ProductDetailBannerTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _bannerImg = [[SDCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 250)];
        _bannerImg.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
        _bannerImg.backgroundColor = [UIColor whiteColor];
        _bannerImg.currentPageDotColor = kColorGray;
        [self.contentView addSubview:_bannerImg];
        
        UIView *lineView = [UIView new];
        lineView.backgroundColor = kColorGray;
        [self.contentView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.top.equalTo(self.bannerImg.mas_bottom);
            make.height.mas_equalTo(@1);
        }];
        
        _tagLabel = [UILabel new];
        _tagLabel.backgroundColor = [UIColor colorWithHex:0xcc0022];
        _tagLabel.layer.cornerRadius = 2.f;
        _tagLabel.layer.masksToBounds = YES;
        _tagLabel.textColor = [UIColor whiteColor];
        _tagLabel.font = kUsualFont(13);
        _tagLabel.text = @"商场自营";
        _tagLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_tagLabel];
        [_tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(@10);
            make.top.equalTo(lineView.mas_bottom).offset(14);
            make.size.mas_equalTo(CGSizeMake(60, 20));
        }];
        
        _titleLabel = [UILabel new];
        _titleLabel.numberOfLines = 2;
        _titleLabel.textColor = [UIColor colorWithHex:0x303033];
        _titleLabel.font = kUsualFont(16);
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self.tagLabel).offset(-3);
            make.right.equalTo(self.contentView).mas_offset(-10);
        }];
        
        _chateauIcon = [UIImageView new];
        _chateauIcon.image = [UIImage imageNamed:@"icon_detail_chateau"];
        [self.contentView addSubview:_chateauIcon];
        [_chateauIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.tagLabel);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
            make.size.mas_equalTo(CGSizeMake(9, 14));
        }];
        
        _chateauName = [UILabel new];
        _chateauName.textColor = [UIColor colorWithHex:0x919199];
        _chateauName.text = @"Tokar Estate";
        _chateauName.font = kUsualFont(14);
        [self.contentView addSubview:_chateauName];
        [_chateauName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.chateauIcon.mas_right).offset(3);
            make.right.equalTo(self.contentView);
            make.centerY.equalTo(self.chateauIcon);
            make.height.mas_equalTo(20);
        }];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        _chateauName.userInteractionEnabled = YES;
        [_chateauName addGestureRecognizer:tap];
        
        _priceLab = [UILabel new];
        _priceLab.text = @"¥ 135.00";
        _priceLab.textColor = [UIColor colorWithHex:0xcc0022];
        _priceLab.font = kUsualFont(18);
        [self.contentView addSubview:_priceLab];
        
        [_priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.tagLabel);
            make.right.equalTo(self.contentView);
            make.height.mas_equalTo(@18);
            make.top.equalTo(self.chateauIcon.mas_bottom).offset(15);
        }];
        
    }
    return self;
}

//- (void)bindData:(WineDetailModel *)model{
//    NSMutableArray *imageUrls = [NSMutableArray new];
//    for (ProductImage *productImage in model.ProductImageList) {
//        [imageUrls addObject:productImage.ImagePath];
//    }
//    _bannerImg.imageURLStringsGroup = imageUrls;
//    _titleLabel.text = [NSString stringWithFormat:@"             %@",model.Name];
//    _chateauName.text = model.StoreName;
//    _priceLab.text = [NSString stringWithFormat:@"¥ %.2f",model.ProductPrice.Price];
//}

- (void)tapAction:(UITapGestureRecognizer *)gesture {
    [_delegate productDetailBannerTableViewCell:self];
}

@end
