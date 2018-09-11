//
//  LoginInputCell.m
//  AFShop
//
//  Created by 飞 on 2018/9/10.
//  Copyright © 2018 飞. All rights reserved.
//

#import "LoginInputCell.h"

@implementation LoginInputCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.textField];
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(25);
            make.left.equalTo(self.contentView).offset(kLoginPadding);
            make.right.equalTo(self.contentView).offset(-kLoginPadding);
            make.bottom.equalTo(self.contentView).offset(-10);
        }];
        
        [self.contentView addSubview:self.lineView];
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(kLineHeight);
            make.left.equalTo(self.contentView).offset(kLoginPadding);
            make.right.equalTo(self.contentView).offset(-kLoginPadding);
            make.bottom.equalTo(self.contentView);
        }];
    }
    return self;
}
#pragma mark - event response
- (void)editDidBegin:(id)sender {
    self.lineView.backgroundColor = kColorGreen;
    if (self.editDidBeginBlock) {
        self.editDidBeginBlock(self.textField.text);
    }
}

- (void)textValueChanged:(id)sender {
    if (self.textValueChangedBlock) {
        self.textValueChangedBlock(self.textField.text);
    }
}

- (void)editDidEnd:(id)sender {
    self.lineView.backgroundColor = kColorLine;
    if (self.editDidEndBlock) {
        self.editDidEndBlock(self.textField.text);
    }
}

#pragma mark - getter and setter
- (UITextField *)textField {
    if (!_textField) {
        _textField = [UITextField new];
        _textField.keyboardType = UIKeyboardTypeNumberPad;
        _textField.placeholder = @"手机号";
        _textField.font = [UIFont systemFontOfSize:15];
        _textField.tintColor = kColorGreen;
        [_textField addTarget:self action:@selector(editDidBegin:) forControlEvents:UIControlEventEditingDidBegin];
        [_textField addTarget:self action:@selector(textValueChanged:) forControlEvents:UIControlEventEditingChanged];
        [_textField addTarget:self action:@selector(editDidEnd:) forControlEvents:UIControlEventEditingDidEnd];
    }
    return _textField;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = [UIColor colorWithHex:0xF0F0F0];
    }
    return _lineView;
}

- (void)setInputType:(InputType)inputType {
    if (inputType == InputTypeNormal) {
        self.textField.keyboardType = UIKeyboardTypeNumberPad;
        self.textField.secureTextEntry = NO;
        self.textField.placeholder = @"手机号";
    }else{
        self.textField.keyboardType = UIKeyboardTypeEmailAddress;
        self.textField.secureTextEntry = YES;
        self.textField.placeholder = @"密码";
    }
}
@end
