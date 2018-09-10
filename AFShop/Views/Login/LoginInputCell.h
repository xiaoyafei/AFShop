//
//  LoginInputCell.h
//  AFShop
//
//  Created by 飞 on 2018/9/10.
//  Copyright © 2018 飞. All rights reserved.
//
#define kCellIdentifier_Login_Input_Cell @"Login_Input_cell"

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, InputType){
    InputTypeNormal,
    InputTypeSecure
};

@interface LoginInputCell : UITableViewCell
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, assign) InputType inputType;

@property (nonatomic, copy) void(^editDidBeginBlock)(NSString *);
@property (nonatomic, copy) void(^textValueChangedBlock)(NSString *);
@property (nonatomic, copy) void(^editDidEndBlock)(NSString *);

@end
