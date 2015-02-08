//
//  ProfileView.m
//  AppathonTemplate
//
//  Created by abhilash on 08/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "ProfileView.h"

@implementation ProfileView

- (instancetype)init
{
    if ((self = ([super init])))
    {
        
    }
    return self;
    
}

- (void)createViews
{
    [super createViews];
    
    UIView *signDetails = [[UIView alloc] initWithFrame:CGRectMake(10, 80, 300, 190)];
    
    [signDetails setBackgroundColor:[UIColor whiteColor]];
    signDetails.layer.cornerRadius = 5.0;
    signDetails.layer.borderWidth = 1.0f;
    signDetails.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    UILabel *headingLabel = [[UILabel alloc] initWithText:@" SIGN IN DETAILS" textAlignment:NSTextAlignmentLeft textColor:[UIColor darkGrayColor] font:[UIFont systemFontOfSize:14]];
    
    [headingLabel setFrame:CGRectMake(10, 0, 280, 30)];
    
    [signDetails addSubview:headingLabel];
    
    UILabel *lineLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 35, 300, 1)];
    
    [lineLabel1 setBackgroundColor:[UIColor lightGrayColor]];
    [signDetails addSubview:lineLabel1];
    
    self.emailLabel = [[UILabel alloc] initWithText:@"abhilash@gmail.com" textAlignment:NSTextAlignmentLeft textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:12]];
    [self.emailLabel setFrame:CGRectMake(10, 45, 280, 30)];
    [signDetails addSubview:self.emailLabel];
    
    self.eTypeLabel = [[UILabel alloc] initWithText:@"EMAIL ID" textAlignment:NSTextAlignmentLeft textColor:[UIColor lightGrayColor] font:[UIFont systemFontOfSize:12]];
    [self.eTypeLabel setFrame:CGRectMake(10, 65, 280, 30)];
    [signDetails addSubview:self.eTypeLabel];
    
    
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 110, 300, 1)];
    
    [lineLabel setBackgroundColor:[UIColor lightGrayColor]];
    [signDetails addSubview:lineLabel];
    
    self.passwordLabel = [[UILabel alloc] initWithText:@"*******" textAlignment:NSTextAlignmentLeft textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:12]];
    [self.passwordLabel setFrame:CGRectMake(10, 120, 280, 30)];
    [signDetails addSubview:self.passwordLabel];
    
    self.changePasswordLabel = [[UILabel alloc] initWithText:@"CHANGE PASSWORD" textAlignment:NSTextAlignmentLeft textColor:[UIColor lightGrayColor] font:[UIFont systemFontOfSize:12]];
    [self.changePasswordLabel setFrame:CGRectMake(10, 140, 280, 30)];
    [signDetails addSubview:self.changePasswordLabel];
    
    [self addSubview:signDetails];
    
    [self userDetailsViewConfiguration];
    UIButton *logOutButton = [[UIButton alloc] initWithButtonFrame:CGRectMake(20, 504, 280, 44) andTitle:@"LOGOUT" andTarget:self selector:nil];
    [logOutButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [logOutButton setBackgroundColor:[UIColor whiteColor]];
    
    logOutButton.layer.cornerRadius = 5.0;
    logOutButton.layer.borderWidth = 1.0f;
    logOutButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    [self addSubview:logOutButton];
}

- (void)userDetailsViewConfiguration
{
    UIView *signDetails = [[UIView alloc] initWithFrame:CGRectMake(10, 280, 300, 190)];
    
    [signDetails setBackgroundColor:[UIColor whiteColor]];
    signDetails.layer.cornerRadius = 5.0;
    signDetails.layer.borderWidth = 1.0f;
    signDetails.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    UILabel *headingLabel = [[UILabel alloc] initWithText:@" MY DETAILS" textAlignment:NSTextAlignmentLeft textColor:[UIColor darkGrayColor] font:[UIFont systemFontOfSize:14]];
    
    [headingLabel setFrame:CGRectMake(10, 0, 280, 30)];
    
    [signDetails addSubview:headingLabel];
    
    UILabel *lineLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 35, 300, 1)];
    
    [lineLabel1 setBackgroundColor:[UIColor lightGrayColor]];
    [signDetails addSubview:lineLabel1];
    
    self.nameLabel = [[UILabel alloc] initWithText:@"Abhilash" textAlignment:NSTextAlignmentLeft textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:12]];
    [self.nameLabel setFrame:CGRectMake(10, 45, 280, 30)];
    [signDetails addSubview:self.nameLabel];
    
    self.nTypeLabel = [[UILabel alloc] initWithText:@"NAME" textAlignment:NSTextAlignmentLeft textColor:[UIColor lightGrayColor] font:[UIFont systemFontOfSize:12]];
    [self.nTypeLabel setFrame:CGRectMake(10, 65, 280, 30)];
    [signDetails addSubview:self.nTypeLabel];
    
    
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 110, 300, 1)];
    
    [lineLabel setBackgroundColor:[UIColor lightGrayColor]];
    [signDetails addSubview:lineLabel];
    
    self.phoneNumberLabel = [[UILabel alloc] initWithText:@"9966557733" textAlignment:NSTextAlignmentLeft textColor:[UIColor blackColor] font:[UIFont systemFontOfSize:12]];
    [self.phoneNumberLabel setFrame:CGRectMake(10, 120, 280, 30)];
    [signDetails addSubview:self.phoneNumberLabel];
    
    self.pTypeLabel = [[UILabel alloc] initWithText:@"MOBILE NUMBER" textAlignment:NSTextAlignmentLeft textColor:[UIColor lightGrayColor] font:[UIFont systemFontOfSize:12]];
    [self.pTypeLabel setFrame:CGRectMake(10, 140, 280, 30)];
    [signDetails addSubview:self.pTypeLabel];
    
    [self addSubview:signDetails];
}
@end
