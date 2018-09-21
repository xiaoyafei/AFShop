//
//  MineTableViewCell.h
//  AFShop
//
//  Created by 飞 on 2018/9/19.
//  Copyright © 2018 飞. All rights reserved.
//
#define kCellIdentifier_Mine_Cell @"Mine_Cell"

#import <UIKit/UIKit.h>

@interface MineTableViewCell : UITableViewCell

@property (nonatomic, strong)UILabel *title;
@property (nonatomic, strong)UIImageView *arrow;
@property (nonatomic, strong)UIView *line;

@end

