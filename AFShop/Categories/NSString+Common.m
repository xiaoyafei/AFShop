//
//  NSString+Common.m
//  AFShop
//
//  Created by 飞 on 2018/9/11.
//  Copyright © 2018 飞. All rights reserved.
//

#import "NSString+Common.h"

@implementation NSString (Common)
- (BOOL)validatePhoneNumber {
    NSString *regex = @"^1+[35789]+\\d{9}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

- (BOOL)validatePassword {
    NSString *regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}

- (CGSize)sizeWithFont:(UIFont *)font andMaxSize:(CGSize)size{
    NSDictionary *attrs = @{NSFontAttributeName: font};
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGFloat)widthWithFont:(UIFont *)font {
    CGSize size = [self sizeWithAttributes:@{NSFontAttributeName: font}];
    return size.width;
}

+ (NSString *)documentsPath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)filePathAtDocumentWithFileName:(NSString *)fileName {
    return [[self documentsPath] stringByAppendingPathComponent:fileName];
}
@end
