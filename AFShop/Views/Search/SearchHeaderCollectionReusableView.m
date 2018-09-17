//
//  SearchHeaderCollectionReusableView.m
//  AFShop
//
//  Created by 飞 on 2018/9/14.
//  Copyright © 2018 飞. All rights reserved.
//

#import "SearchHeaderCollectionReusableView.h"

@implementation SearchHeaderCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.button];
        [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-10);
            make.bottom.top.equalTo(self);
            make.width.mas_equalTo(44);
        }];
        [self addSubview:self.title];
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(10);
            make.bottom.top.equalTo(self);
            make.width.mas_equalTo(200);
        }];
    }
    return self;
}
#pragma mark - event response
- (void)didTappedButton:(id)sender {
    if (self.buttonTappedBlock) {
        self.buttonTappedBlock(self.button);
    }
}

#pragma mark - getter and setter
- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button addTarget:self action:@selector(didTappedButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (UILabel *)title {
    if (!_title) {
        _title = [UILabel new];
        _title.font = [UIFont systemFontOfSize:12];
        _title.textColor = kColorTextBlack;
    }
    return _title;
}

@end
