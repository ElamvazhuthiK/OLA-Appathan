//
//  BaseHeaderViewController.m
//  AppathonTemplate
//
//  Created by Raghunathan on 2/8/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "BaseHeaderViewController.h"
#import "BaseHeaderView.h"

@interface BaseHeaderViewController ()
@property (nonatomic,strong) BaseHeaderView *baseHeaderView;

@end

@implementation BaseHeaderViewController


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
    self.baseHeaderView = [[BaseHeaderView alloc] init];
    [self.view addSubview:self.baseHeaderView];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.baseHeaderView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

@end
