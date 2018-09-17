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
            make.edges.equalTo(self.contentView);
        }];
    }
    return self;
}

- (UILabel *)tagLabel {
    if (!_tagLabel) {
        _tagLabel = [UILabel new];
        _tagLabel.backgroundColor = kColorLightGray;
        _tagLabel.textColor = kColorTextBlack;
        _tagLabel.font = [UIFont systemFontOfSize:14];
        _tagLabel.textAlignment = NSTextAlignmentCenter;
        _tagLabel.layer.cornerRadius = 15.f;
        _tagLabel.layer.masksToBounds = YES;
    }
    return _tagLabel;
}

@end
