//
//  SearchTextTagCollectionViewCell.h
//  AFShop
//
//  Created by 飞 on 2018/9/14.
//  Copyright © 2018 飞. All rights reserved.
//
static NSString *const SearchTagCellIdentifier = @"SearchTagCellIdentifier";
#define kTagTextPadding 10

#import <UIKit/UIKit.h>

@interface SearchTagCollectionViewCell : UICollectionViewCell

@property(nonatomic, strong)UILabel *tagLabel;

@end
