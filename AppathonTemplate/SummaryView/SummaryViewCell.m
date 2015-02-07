//
//  SummaryViewCell.m
//  AppathonTemplate
//
//  Created by Raghunathan on 2/7/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "SummaryViewCell.h"

@interface SummaryViewCell ()

@property (nonatomic,strong) UIImageView *iimageView;
@property (nonatomic,strong) UILabel *headerLabel,*timeSecLabel,*timeLabel,*carTypelabel,*timeValueLabe;

@end

@implementation SummaryViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        [self createViews];
    }
    
    return self;
}

- (void)createViews
{
    //self.headerLabel = [UILabel alloc]initWithText:@"Test" textAlignment:NSTextAlignmentLeft textColor:[UIColor blackColor] font:[UIFont fontWithName:COMMONBOLDFONT size:18.0];
    
}

@end
