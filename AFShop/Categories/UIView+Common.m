//
//  UIView+Common.m
//  AFShop
//
//  Created by 飞 on 2018/9/27.
//  Copyright © 2018 飞. All rights reserved.
//

#import "UIView+Common.h"

@implementation UIView (Common)

+ (UIView *)emptyViewWithFrame:(CGRect)frame andText:(NSString *)text {
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = kColorGray;
    
    UILabel *label = [UILabel new];
    label.text = text;
    label.font = [UIFont systemFontOfSize:16];
    label.textColor = kColorTextGray;
    [view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(view);
    }];
    return view;
    
}

@end
