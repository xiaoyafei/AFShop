//
//  WineDetailDescTableViewCell.h
//  WineMarket
//
//  Created by 肖遥 on 2017/12/11.
//  Copyright © 2017年 XiaoYaFei. All rights reserved.
//

#import <UIKit/UIKit.h>
static NSString *const ProductDetailDescTableViewCellIdentifier = @"ProductDetailDescTableViewCellIdentifier";

@interface ProductDetailDescTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *desLab;

@end
