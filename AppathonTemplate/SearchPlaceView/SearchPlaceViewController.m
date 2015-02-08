//
//  SearchPlaceViewController.m
//  AppathonTemplate
//
//  Created by Raghunathan on 2/8/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "SearchPlaceViewController.h"
#import "SearchPlaceView.h"
#import "SummaryViewController.h"



@interface SearchPlaceViewController ()

@property (nonatomic,strong) SearchPlaceView *searchPlaceView;

@end


@implementation SearchPlaceViewController

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
    
    self.searchPlaceView = [[SearchPlaceView alloc] init];
    [self.view addSubview:self.searchPlaceView];
    
    [self.searchPlaceView.resetBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.searchPlaceView.doneBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClick:(UIButton *)sender
{
    if (sender == self.searchPlaceView.resetBtn)
    {
        self.searchPlaceView.widget2.bodyLabel.text = @"Domlur";
        [self.searchPlaceView.tableView reloadData];
    }
    else
    {
        SummaryViewController *vc = [[SummaryViewController alloc] init];
        [self navigateToViewController:vc];
    }
}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.searchPlaceView.frame = self.view.bounds;
}

@end
