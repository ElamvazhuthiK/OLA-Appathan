//
//  SelectedTripDetailsView.m
//  AppathonTemplate
//
//  Created by abhilash on 07/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "SelectedTripDetailsView.h"

@implementation SelectedTripDetailsView

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
    
    self.placeInfoLabel = [[UILabel alloc] initWithTextAlignment:NSTextAlignmentCenter andTextColor:[UIColor blackColor] andTextFont:[UIFont fontWithName:@"Helvetica" size:12]];
    
    [self addSubview:self.placeInfoLabel];
    
    self.picksContainerScrollView = [[UIScrollView alloc] init];
    [self addSubview:self.picksContainerScrollView];
    
    
    self.cabsInfoScrollView = [[UIScrollView alloc] init];
    [self addSubview:self.cabsInfoScrollView];
    
    [self.picksContainerScrollView setContentSize:CGSizeMake(560, 120)];
    [self.cabsInfoScrollView setContentSize:CGSizeMake(1060, 72)];
}

- (void)layoutSubviews
{
    //[self.commentTextView setFrame:CGRectMake(10, 74, 300, 200)];
    [self.placeInfoLabel setFrame:CGRectMake(10, 74, 300, 100)];
    [self.picksContainerScrollView setFrame:CGRectMake(0, 184, 320, 120)];
    [self.cabsInfoScrollView setFrame:CGRectMake(0, 496, 320, 72)];
    
}

@end
