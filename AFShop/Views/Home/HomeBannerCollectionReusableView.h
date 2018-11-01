//
//  HomeBannerCollectionReusableView.h
//  AFShop
//
//  Created by 飞 on 2018/9/26.
//  Copyright © 2018 飞. All rights reserved.
//

static NSString *const HomeHeaderCellIdentifier = @"HomeHeaderCellIdentifier";

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"

@interface HomeBannerCollectionReusableView : UICollectionReusableView <SDCycleScrollViewDelegate>

@property (nonatomic, strong)SDCycleScrollView *cycleScrollView;

@end
