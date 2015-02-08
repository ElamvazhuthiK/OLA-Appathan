//
//  BaseHeaderView.m
//  AppathonTemplate
//
//  Created by Raghunathan on 2/8/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "BaseHeaderView.h"

@interface BaseHeaderView ()



@end

@implementation BaseHeaderView

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        [self createViews];
        
    }
    
    return self;
}

- (void)createViews
{
    [super createViews];
    
    self.topBar = [[UIView alloc]init];
    self.topBar.backgroundColor = UIColorFromRGB(0xD7DE52);
    [self.fullContentView addSubview:self.topBar];
    
    self.titleLabel = [[UILabel alloc] initWithText:@"Cab For The Day" textAlignment:NSTextAlignmentCenter textColor:[UIColor blackColor] font:[UIFont fontWithName:@COMMONGFONT size:18]];
    [self.topBar addSubview:self.titleLabel];
    
    self.menuBtn = [[UIButton alloc] init];
    [self.menuBtn setImage:[UIImage imageNamed:@"menu.png"] forState:UIControlStateNormal];
    [self.topBar addSubview:self.menuBtn];
    
    self.mainContentView = [[UIView alloc] init];
    [self.fullContentView addSubview:self.mainContentView];

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.topBar.frame = CGRectMake(0,0, self.fullContentView.frame.size.width, 50);
    self.menuBtn.frame = CGRectMake(0, 0, 50, self.topBar.frame.size.height);
    
    self.titleLabel.frame = CGRectMake(self.menuBtn.frame.size.width + self.menuBtn.frame.origin.x ,0, self.topBar.frame.size.width - (self.menuBtn.frame.size.width + self.menuBtn.frame.origin.x ), self.topBar.frame.size.height);
    
    
    self.mainContentView.frame = CGRectMake(5, self.topBar.frame.origin.y + self.topBar.frame.size.height, self.fullContentView.frame.size.width - 10, self.fullContentView.frame.size.height - (self.topBar.frame.origin.y + self.topBar.frame.size.height));
}

@end
