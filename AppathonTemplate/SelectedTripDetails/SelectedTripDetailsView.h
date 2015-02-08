//
//  SelectedTripDetailsView.h
//  AppathonTemplate
//
//  Created by abhilash on 07/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "BaseView.h"

@interface SelectedTripDetailsView : BaseView

@property (nonatomic, strong) UILabel *placeInfoLabel;
@property (nonatomic, strong) UIScrollView *picksContainerScrollView;

@property (nonatomic, strong) UITextView *aboutPlaceTextView;

@property (nonatomic, strong) UIScrollView *cabsInfoScrollView;

@end
