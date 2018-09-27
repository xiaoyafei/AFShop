//
//  HomeBannerCollectionReusableView.m
//  AFShop
//
//  Created by 飞 on 2018/9/26.
//  Copyright © 2018 飞. All rights reserved.
//

#import "HomeBannerCollectionReusableView.h"

@implementation HomeBannerCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:[UIImage imageNamed:@"avatar_default"]];
        [self addSubview:_cycleScrollView];
        [_cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}
@end
