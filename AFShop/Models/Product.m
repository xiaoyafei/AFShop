//
//  Product.m
//  AFShop
//
//  Created by 飞 on 2018/10/25.
//  Copyright © 2018 飞. All rights reserved.
//

#import "Product.h"

@implementation Product
- (NSString *)description {
    return [NSString stringWithFormat:@"SysNo=%ld;ProductName=%@;ProductDesc=%@;CurrentPrice=%.2f;",_pkid,_ProductName,_ProductDesc,_CurrentPrice];
}
@end
