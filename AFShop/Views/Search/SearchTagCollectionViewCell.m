//
//  SearchTextTagCollectionViewCell.m
//  AFShop
//
//  Created by 飞 on 2018/9/14.
//  Copyright © 2018 飞. All rights reserved.
//

#import "SearchTagCollectionViewCell.h"

@implementation SearchTagCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.tagLabel];
        [self.tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(kTagTextPadding);
            make.right.equalTo(self.contentView).offset(-kTagTextPadding);
            make.top.bottom.equalTo(self.contentView);
        }];
        self.contentView.layer.masksToBounds = YES;
        self.contentView.layer.cornerRadius = 15;
        self.contentView.backgroundColor = kColorLightGray;
    }
    return self;
}

- (UILabel *)tagLabel {
    if (!_tagLabel) {
        _tagLabel = [UILabel new];
        _tagLabel.textColor = kColorTextBlack;
        _tagLabel.font = [UIFont systemFontOfSize:12];
        _tagLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _tagLabel;
}

@end
