//
//  SearchHeaderCollectionReusableView.h
//  AFShop
//
//  Created by 飞 on 2018/9/14.
//  Copyright © 2018 飞. All rights reserved.
//
#define kCellIdentifier_Search_Header @"Search_Header"

#import <UIKit/UIKit.h>

@interface SearchHeaderCollectionReusableView : UICollectionReusableView

@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UIButton *button;

@property (nonatomic, copy) void(^buttonTappedBlock)(id sender);

@end
