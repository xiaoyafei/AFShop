//
//  Product.h
//  AFShop
//
//  Created by 飞 on 2018/10/25.
//  Copyright © 2018 飞. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, ProductStatus) {
    ProductStatusNormal = 1,
    ProductStatusVoid = 2,
};

@interface Product : NSObject

@property (nonatomic, assign) NSInteger pkid;
@property (nonatomic, copy) NSString *ProductName;
@property (nonatomic, copy) NSString *ProductDesc;
@property (nonatomic, assign) CGFloat CurrentPrice;
@property (nonatomic, assign) CGFloat OriginPrice;
@property (nonatomic, assign) NSInteger Count;
@property (nonatomic, assign) ProductStatus Status;
@property (nonatomic, copy) NSString *ImageUrl;
@end
