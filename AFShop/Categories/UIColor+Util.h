//
//  UIColor+Util.h
//  AFShop
//
//  Created by 飞 on 2018/9/10.
//  Copyright © 2018 飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Util)

+ (UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHex:(int)hexValue;
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert andAlpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
@end
