//
//  BaseHeaderView.h
//  AppathonTemplate
//
//  Created by Raghunathan on 2/8/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "BaseView.h"

@interface BaseHeaderView : BaseView
@property (nonatomic, strong) NSArray *mContentListArray;
@property (nonatomic,strong) UIView *topBar;
@property (nonatomic,strong) UIView *mainContentView;

@property (nonatomic,strong) UIButton *menuBtn;
@property (nonatomic, strong) UITableView *menuListTableView;

@end
