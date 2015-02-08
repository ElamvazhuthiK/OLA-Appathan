//
//  LoginView.h
//  AppathonTemplate
//
//  Created by inxs tech on 07/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "BaseView.h"
@protocol LoginViewDelegate <BaseViewDelegate>

@end
@interface LoginView : BaseView
@property(nonatomic, weak)id<LoginViewDelegate> delegate;
@property(nonatomic, strong)UITextField *userEmailTextField;
@property(nonatomic, strong)UITextField *passwordTextField;
@property(nonatomic, strong)UIButton *submitButton;

@end
