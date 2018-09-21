//
//  MineTableViewCell.m
//  AFShop
//
//  Created by 飞 on 2018/9/19.
//  Copyright © 2018 飞. All rights reserved.
//

#import "MineTableViewCell.h"

@implementation MineTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.title];
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(kPadding);
            make.right.top.bottom.equalTo(self.contentView);
        }];
        
        [self.contentView addSubview:self.arrow];
        [self.arrow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-26);
            make.size.mas_equalTo(CGSizeMake(16, 16));
            make.centerY.equalTo(self.contentView);
        }];
        
        [self.contentView addSubview:self.line];
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.title);
            make.right.equalTo(self.arrow);
            make.bottom.equalTo(self.contentView);
            make.height.mas_equalTo(kLineHeight);
        }];
    }
    return self;
}

#pragma mark - setter & getter
- (UILabel *)title {
    if (!_title) {
        _title = [UILabel new];
        _title.font = [UIFont systemFontOfSize:14];
        _title.textColor = kColorTextBlack;
    }
    return _title;
}

- (UIImageView *)arrow {
    if (!_arrow) {
        _arrow = [UIImageView new];
        _arrow.image = [UIImage imageNamed:@"ic_arrow"];
    }
    return _arrow;
}

- (UIView *)line {
    if (!_line) {
        _line = [UIView new];
        _line.backgroundColor = kColorLine;
    }
    return _line;
}

@end
