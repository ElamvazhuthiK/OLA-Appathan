//
//  WidgetView.h
//  AppathonTemplate
//
//  Created by Raghunathan on 2/7/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WidgetView : UIView

@property (nonatomic,strong) UILabel *titleLabel,*bodyLabel;

@property (nonatomic,strong) UILabel *leftSepLine,*rightSepLine;
@property (nonatomic,strong) UILabel *bottomHighLightLabel;

@end
