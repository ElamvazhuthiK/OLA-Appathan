//
//  SignView.h
//  AppathonTemplate
//
//  Created by inxs tech on 07/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "BaseView.h"

@interface SignView : BaseView

@property(nonatomic, strong)UITextField *userEmailTextField;
@property(nonatomic, strong)UITextField *passwordTextField;
@property(nonatomic, strong)UITextField *mobileNumberOfUserTextField;
@property(nonatomic, strong)UITextField *userNameTextField;

@property(nonatomic, strong)UIButton *signUpButton;

@end
