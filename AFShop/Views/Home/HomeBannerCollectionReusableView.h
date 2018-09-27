//
//  HomeBannerCollectionReusableView.h
//  AFShop
//
//  Created by 飞 on 2018/9/26.
//  Copyright © 2018 飞. All rights reserved.
//

#define kCellIdentifier_Home_Header_cell @"Home_Header_Cell"

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"

@interface HomeBannerCollectionReusableView : UICollectionReusableView <SDCycleScrollViewDelegate>

@property (nonatomic, strong)SDCycleScrollView *cycleScrollView;

@end
