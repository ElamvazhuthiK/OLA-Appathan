//
//  SignView.m
//  AppathonTemplate
//
//  Created by inxs tech on 07/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "SignView.h"

@interface SignView()

@end
@implementation SignView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}

- (void)createViews
{
    [super createViews];
    
    self.userEmailTextField = [[UITextField alloc] initWithPlaceholder:@"email" andBackgroundColor:[UIColor clearColor] andTextColor:[UIColor blueColor] andTextAlignment:NSTextAlignmentCenter andBorderStyle:UITextBorderStyleLine];
    [self addSubview:self.userEmailTextField];
    
    self.passwordTextField = [[UITextField alloc] initWithPlaceholder:@"Password" andBackgroundColor:[UIColor clearColor] andTextColor:[UIColor blueColor] andTextAlignment:NSTextAlignmentCenter andBorderStyle:UITextBorderStyleLine];
    
    self.userEmailTextField = [[UITextField alloc] initWithPlaceholder:@"email" andBackgroundColor:[UIColor clearColor] andTextColor:[UIColor blueColor] andTextAlignment:NSTextAlignmentCenter andBorderStyle:UITextBorderStyleLine];
    [self addSubview:self.userEmailTextField];
    
    self.passwordTextField = [[UITextField alloc] initWithPlaceholder:@"Password" andBackgroundColor:[UIColor clearColor] andTextColor:[UIColor blueColor] andTextAlignment:NSTextAlignmentCenter andBorderStyle:UITextBorderStyleLine];
    
    self.passwordTextField.secureTextEntry = YES;
    [self addSubview:self.passwordTextField];
    
    self.mobileNumberOfUserTextField = [[UITextField alloc] initWithPlaceholder:@"Mobile Number" andBackgroundColor:[UIColor clearColor] andTextColor:[UIColor blueColor] andTextAlignment:NSTextAlignmentCenter andBorderStyle:UITextBorderStyleLine];
    [self addSubview:self.mobileNumberOfUserTextField];
    
    self.userNameTextField = [[UITextField alloc] initWithPlaceholder:@"Name" andBackgroundColor:[UIColor clearColor] andTextColor:[UIColor blueColor] andTextAlignment:NSTextAlignmentCenter andBorderStyle:UITextBorderStyleLine];
    
    [self addSubview:self.userNameTextField];
    
    
    self.signUpButton = [[UIButton alloc] initWithTitle:@"SignUp" andBackgroundImage:@"" andTextColor:[UIColor blueColor]];
    [self addSubview:self.signUpButton];
}

- (void)layoutSubviews
{
    [self.userEmailTextField setFrame:CGRectMake(60, 74, 200, 30)];
    [self.passwordTextField setFrame:CGRectMake(60, 114, 200, 30)];
    [self.mobileNumberOfUserTextField setFrame:CGRectMake(60, 154, 200, 30)];
    [self.userNameTextField setFrame:CGRectMake(60, 194, 200, 30)];
    
    [self.signUpButton setFrame:CGRectMake(60, 234, 200, 30)];
}

- (void)dealloc
{
}

@end
