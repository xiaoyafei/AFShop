//
//  ProductDetailBottomView.h
//  AFShop
//
//  Created by 肖遥 on 2018/10/31.
//  Copyright © 2018年 XiaoYaFei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ProductDetailBottomView;
@protocol ProductDetailBottomViewDelegate <NSObject>
- (void)productDetailBottomView:(ProductDetailBottomView *)sender index:(NSInteger)index;
@end

@interface ProductDetailBottomView : UIView
@property (weak, nonatomic) IBOutlet UIButton *carBtn;
@property (weak, nonatomic) IBOutlet UIView *cartView;
@property (weak, nonatomic) IBOutlet UIButton *collectionBtn;
@property (weak, nonatomic) IBOutlet UIButton *joinBtn;
@property (weak, nonatomic) id<ProductDetailBottomViewDelegate> delegate;
@end

