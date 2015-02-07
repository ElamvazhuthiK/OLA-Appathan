//
//  InitialView.m
//  AppathonTemplate
//
//  Created by Raghunathan on 2/7/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "InitialView.h"


@interface InitialView ()

@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation InitialView

- (instancetype) init
{
    self = [super init];
    
    if (self)
    {
        
    }
    
    return self;
}

- (void)createViews
{
    //[super createViews];
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"initialImage"] bgColor:[UIColor clearColor]];
    [self addSubview:self.imageView];
    
    self.signUpBtn = [[UIButton alloc] initWithTitle:@"SIGNUP" andBackgroundImage:@"image" andTextColor:[UIColor blackColor]];
    [self addSubview:self.signUpBtn];
    
    self.loginBtn = [[UIButton alloc] initWithTitle:@"LOGIN" andBackgroundImage:@"image" andTextColor:[UIColor blackColor]];
    [self addSubview:self.loginBtn];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    float startXPos = 0;
    float startYPos = 0;
    float fullWidth = self.frame.size.width - (startXPos*2);
    float fullHeight = self.frame.size.height- (startYPos*2);
    
    self.imageView.frame = CGRectMake(startXPos, startYPos, fullWidth, fullHeight - 50);
    self.signUpBtn.frame = CGRectMake(startXPos, self.imageView.frame.size.height + self.imageView.frame.origin.y, fullWidth/2, fullHeight - (self.imageView.frame.size.height + self.imageView.frame.origin.y));
    self.loginBtn.frame = CGRectMake(self.signUpBtn.frame.origin.x + self.signUpBtn.frame.size.width, self.imageView.frame.size.height + self.imageView.frame.origin.y, fullWidth - (self.signUpBtn.frame.origin.x + self.signUpBtn.frame.size.width), fullHeight - (self.imageView.frame.size.height + self.imageView.frame.origin.y));
    
}

@end
