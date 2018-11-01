//
//  WineDetailPropertyTableViewCell.h
//  WineMarket
//
//  Created by 肖遥 on 2017/12/11.
//  Copyright © 2017年 XiaoYaFei. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const ProductDetailPropertyTableViewCellIdentifier = @"ProductDetailPropertyTableViewCellIdentifier";

@interface ProductDetailPropertyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *key1Lab;
@property (weak, nonatomic) IBOutlet UILabel *value1Lab;
@property (weak, nonatomic) IBOutlet UILabel *key2Lab;
@property (weak, nonatomic) IBOutlet UILabel *value2Lab;

@end
