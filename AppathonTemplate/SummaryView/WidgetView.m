//
//  WidgetView.m
//  AppathonTemplate
//
//  Created by Raghunathan on 2/7/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "WidgetView.h"

@interface WidgetView ()

@property (nonatomic,strong) UILabel *titleLabel,*bodyLabel;

@end

@implementation WidgetView

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
    self.titleLabel = [[UILabel alloc] initWithText:@"Test" textAlignment:NSTextAlignmentCenter textColor:UIColorFromRGB(0x343331) font:[UIFont fontWithName:@COMMONGFONT size:18]];
    [self addSubview:self.titleLabel];
    
    self.bodyLabel = [[UILabel alloc] initWithText:@"Test" textAlignment:NSTextAlignmentCenter textColor:[UIColor whiteColor] font:[UIFont fontWithName:@COMMONBOLDFONT size:21]];
    [self addSubview:self.bodyLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    float startXPos = 0;
    float startYPos = 0;
    float fullWidth = self.frame.size.width - (startXPos*2);
    float fullHeight = self.frame.size.height- (startYPos*2);
    
    self.titleLabel.frame = CGRectMake(startXPos, startYPos, fullWidth, fullHeight/3);
    self.bodyLabel.frame = CGRectMake(startXPos, self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height , fullWidth, fullHeight -(self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height));
}

@end
