//
//  HomeCollectionViewCell.m
//  AFShop
//
//  Created by 飞 on 2018/9/26.
//  Copyright © 2018 飞. All rights reserved.
//

#import "HomeCollectionViewCell.h"

@implementation HomeCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _imageView = [UIImageView new];
        _imageView.image = [UIImage imageNamed:@"test"];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
        [self addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).mas_offset(10);
            make.right.equalTo(self).mas_offset(-10);
            make.top.equalTo(self).offset(10);
            make.bottom.equalTo(self).offset(-100);
        }];
        
        _tagLabel = [UILabel new];
        _tagLabel.textColor = [UIColor whiteColor];
        _tagLabel.backgroundColor = [UIColor colorWithHex:0xFC88AF];
        _tagLabel.font = [UIFont systemFontOfSize:11];
        _tagLabel.text = @"全新";
        _tagLabel.textAlignment = NSTextAlignmentCenter;
        _tagLabel.layer.cornerRadius = 3.f;
        _tagLabel.layer.masksToBounds = YES;
        [self addSubview:_tagLabel];
        [_tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imageView);
            make.top.equalTo(self.imageView.mas_bottom).offset(10);
            make.size.mas_equalTo(CGSizeMake(30, 20));
        }];
        
        _title = [UILabel new];
        _title.font = [UIFont systemFontOfSize:14];
        _title.textColor = kColorTextBlack;
        _title.text = @"竹节水电T恤";
        [self addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.tagLabel.mas_right).offset(5);
            make.right.equalTo(self.imageView);
            make.top.bottom.equalTo(self.tagLabel);
        }];
        
        _desc = [UILabel new];
        _desc.font = [UIFont systemFontOfSize:12];
        _desc.textColor = kColorTextGray;
        _desc.text = @"无印良品";
        [self addSubview:_desc];
        [_desc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.tagLabel);
            make.top.equalTo(self.tagLabel.mas_bottom).offset(10);
        }];
        
        _price = [UILabel new];
        _price.font = [UIFont boldSystemFontOfSize:16];
        _price.textColor = [UIColor colorWithHex:0xF0604F];
        _price.text = @"¥58";
        NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:@"¥58"];
        [attributedStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:12] range:NSMakeRange(0, 1)];
        _price.attributedText = attributedStr;
        [self addSubview:_price];
        [_price mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.tagLabel);
            make.bottom.equalTo(self).offset(-10);
        }];
        
        _original = [UILabel new];
        _original.text = @"原价68";
        _original.textColor = kColorTextGray;
        _original.font = [UIFont systemFontOfSize:12];
        [self addSubview:_original];
        [_original mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.price.mas_right).offset(5);
            make.bottom.equalTo(self.price).offset(-2);
        }];
    }
    return self;
}
@end
