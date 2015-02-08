//
//  LoginView.m
//  AppathonTemplate
//
//  Created by inxs tech on 07/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "LoginView.h"

@interface LoginView()

@end

@implementation LoginView

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
    
    
    self.passwordTextField.secureTextEntry = YES;
    [self addSubview:self.passwordTextField];
    
    self.submitButton = [[UIButton alloc] initWithTitle:@"Submit" andBackgroundImage:@"" andTextColor:[UIColor blueColor]];
    [self addSubview:self.submitButton];
    
//    self.signUpButton = [[UIButton alloc] initWithTitle:@"SignUp" andBackgroundImage:@"" andTextColor:[UIColor blueColor]];
//    [self addSubview:self.signUpButton];

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.userEmailTextField setFrame:CGRectMake(60, 374, 200, 30)];
    [self.passwordTextField setFrame:CGRectMake(60, 414, 200, 30)];
    [self.submitButton setFrame:CGRectMake(60, 454, 200, 30)];
//    [self.signUpButton setFrame:CGRectMake(60, 194, 200, 30)];
}
- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSUInteger touchCount = [touches count];
    if (touchCount == 1) {
        if ([self.delegate respondsToSelector:@selector(removeView)]) {
            [self.delegate removeView];
        }
    }
}

@end
