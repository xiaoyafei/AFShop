//
//  HomeCollectionViewCell.h
//  AFShop
//
//  Created by 飞 on 2018/9/26.
//  Copyright © 2018 飞. All rights reserved.
//
#define kCellIdentifier_Home_Cell @"Home_Cell"

#import <UIKit/UIKit.h>

@interface HomeCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong)UIImageView *imageView;
@property (nonatomic, strong)UILabel *tagLabel;
@property (nonatomic, strong)UILabel *title;
@property (nonatomic, strong)UILabel *desc;
@property (nonatomic, strong)UILabel *price;
@property (nonatomic, strong)UILabel *original;
@end

