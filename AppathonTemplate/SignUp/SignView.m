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
        self.backgroundColor = [UIColor yellowColor];
        [self createViews];
    }
    return self;
}

- (void)createViews
{
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
    [super layoutSubviews];
    [self.userEmailTextField setFrame:CGRectMake(60, 314, 200, 30)];
    [self.passwordTextField setFrame:CGRectMake(60, 364, 200, 30)];
    [self.mobileNumberOfUserTextField setFrame:CGRectMake(60, 414, 200, 30)];
    [self.userNameTextField setFrame:CGRectMake(60, 464, 200, 30)];
    
    [self.signUpButton setFrame:CGRectMake(60, 514, 200, 30)];
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSUInteger touchCount = [touches count];
    if (touchCount == 1) {
        if ([self.delegate respondsToSelector:@selector(removeView)]) {
            [self.delegate removeView];
        }
    }
}
- (void)dealloc
{
}

//@implementation SignView
//
@end
