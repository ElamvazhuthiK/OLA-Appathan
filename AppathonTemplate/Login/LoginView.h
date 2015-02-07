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
@property(nonatomic, strong)UITextField *txtFieldUsername;
@property(nonatomic, strong)UITextField *txtFieldPassword;
@property(nonatomic, strong)UIButton *btnSignUp;
@property(nonatomic, strong)UIButton *btnSubmit;
@end
