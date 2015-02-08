//
//  SearchPlaceViewController.m
//  AppathonTemplate
//
//  Created by Raghunathan on 2/8/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "SearchPlaceViewController.h"
#import "SearchPlaceView.h"


@interface SearchPlaceViewController ()

@property (nonatomic,strong) SearchPlaceView *searchPlaceView;

@end


@implementation SearchPlaceViewController

- (void)loadView
{
    self.searchPlaceView = [[SearchPlaceView alloc] init];
    self.view = self.searchPlaceView;
    
}


@end
