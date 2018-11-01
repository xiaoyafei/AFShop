//
//  WineDetailBottomView.m
//  WineMarket
//
//  Created by 肖遥 on 2017/12/12.
//  Copyright © 2017年 XiaoYaFei. All rights reserved.
//

#import "ProductDetailBottomView.h"

@implementation ProductDetailBottomView

- (void)awakeFromNib {
    [super awakeFromNib];
    [_carBtn verticalImageAndTitle:4];
    [_collectionBtn verticalImageAndTitle:4];
    _collectionBtn.selected = YES;
    [_joinBtn setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHex:0x303030]] forState:UIControlStateNormal];
    [_joinBtn setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHex:0xA1A1A1]] forState:UIControlStateDisabled];
    AFViewBorderRadius(_cartView, 1, 1, [UIColor colorWithHex:0xC8C8C8]);
}


//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//        // 先添加View
//        UIView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class) owner:self options:nil].firstObject;
//        view.frame = frame;
//        self = view;
//    }
//    return self;
//}

- (IBAction)action:(UIButton *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(productDetailBottomView:index:)]) {
        [_delegate productDetailBottomView:self index:sender.tag];
    }
    NSLog(@"click %ld",(long)sender.tag);
}

@end
