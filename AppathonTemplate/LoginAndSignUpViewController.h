//
//  LoginAndSignUpViewController.h
//  AppathonTemplate
//
//  Created by abhilash on 08/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginAndSignUpViewController : UIViewController
{
    UIView *signupView, *loginView;
    
    UIView *signupBtnView, *loginBtnView;
    UILabel *signupLabel, *loginLabel;
    
    UIButton *nextButton, *doneButton, *forgotPasswordBtn, *backgroundButton;
    
    UITextField *signupUsernameField, *signupEmailField, *signupPasswordField, *signUpConfirmPassword, *signupMobileField;
    
    UITextField *loginUsernameField, *loginPasswordField;
}


- (IBAction)loginDoneAction;
- (IBAction)signupNextAction;

@end
