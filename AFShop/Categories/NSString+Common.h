//
//  NSString+Common.h
//  AFShop
//
//  Created by 飞 on 2018/9/11.
//  Copyright © 2018 飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Common)
- (BOOL)validatePhoneNumber;
- (BOOL)validatePassword;
- (CGSize)sizeWithFont:(UIFont *)font andMaxSize:(CGSize)size;
- (CGFloat)widthWithFont:(UIFont *)font;
@end
