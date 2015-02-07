//
//  SummaryViewController.m
//  AppathonTemplate
//
//  Created by Raghunathan on 2/7/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "SummaryViewController.h"
#import "SummaryView.h"


@interface SummaryViewController ()

@property (nonatomic,strong) SummaryView *summaryView;

@end

@implementation SummaryViewController

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        //[self createViews];
    }
    
    return self;
    
}

- (void)createViews
{
    NSLog(@"view %@",self.view);
    
    self.summaryView = [[SummaryView alloc] init];
    [self.view addSubview:self.summaryView];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.summaryView.frame = self.view.bounds;
}

@end
