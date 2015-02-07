//
//  BaseHeaderView.m
//  AppathonTemplate
//
//  Created by Raghunathan on 2/8/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "BaseHeaderView.h"

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
    self.topBar.backgroundColor = [UIColor yellowColor];
    [self.fullContentView addSubview:self.topBar];
    
    self.mainContentView = [[UIView alloc] init];
    [self.fullContentView addSubview:self.mainContentView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.topBar.frame = CGRectMake(0,0, self.fullContentView.frame.size.width, 50);

    self.mainContentView.frame = CGRectMake(5, self.topBar.frame.origin.y + self.topBar.frame.size.height, self.fullContentView.frame.size.width - 10, self.fullContentView.frame.size.height - (self.topBar.frame.origin.y + self.topBar.frame.size.height));
}

@end
