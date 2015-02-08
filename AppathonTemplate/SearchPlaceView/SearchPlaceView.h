//
//  SearchPlaceView.h
//  AppathonTemplate
//
//  Created by Raghunathan on 2/8/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "BaseHeaderView.h"
#import "WidgetView.h"

@interface SearchPlaceView : BaseHeaderView

@property (nonatomic,strong) UIButton *doneBtn,*resetBtn;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) WidgetView *widget1,*widget2,*widget3;


@end
