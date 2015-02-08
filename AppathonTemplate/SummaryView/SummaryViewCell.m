//
//  SummaryViewCell.m
//  AppathonTemplate
//
//  Created by Raghunathan on 2/7/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "SummaryViewCell.h"

@interface SummaryViewCell ()

@property (nonatomic,strong) UIView *containerView;
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *headerLabel,*timeSecLabel,*timeLabel,*carTypelabel;

@end

@implementation SummaryViewCell

@synthesize imageView;

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
    self.containerView = [[UIView alloc] init];
    self.containerView.backgroundColor = UIColorFromRGB(0xC7C2BF);
    self.containerView.alpha = 0.9;
    [self.contentView addSubview:self.containerView];
    
    self.headerLabel = [[UILabel alloc]initWithText:@"Majestic- ISKAN temple" textAlignment:NSTextAlignmentLeft textColor:[UIColor blackColor] font:[UIFont fontWithName:@COMMONBOLDFONT size:14.0]];
    [self.containerView addSubview:self.headerLabel];
    
    self.timeSecLabel = [[UILabel alloc]initWithText:@"33 mins without Traffic" textAlignment:NSTextAlignmentLeft textColor:[UIColor grayColor] font:[UIFont fontWithName:@COMMONGFONT size:12.0]];
    [self.containerView addSubview:self.timeSecLabel];
    
    self.timeLabel = [[UILabel alloc]initWithText:@"Time: 6 am - 9 Pm (2 - 4 Pm Break)" textAlignment:NSTextAlignmentLeft textColor:[UIColor grayColor] font:[UIFont fontWithName:@COMMONGFONT size:11.0]];
    [self.containerView addSubview:self.timeLabel];
    
    self.carTypelabel = [[UILabel alloc]initWithText:@"2 Sadans and 1 Mini cabs are by You" textAlignment:NSTextAlignmentLeft textColor:[UIColor grayColor] font:[UIFont fontWithName:@COMMONGFONT size:14.0]];
    [self.containerView addSubview:self.carTypelabel];
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"unnamed.png"] bgColor:[UIColor clearColor]];
    [self.containerView addSubview:self.imageView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.containerView.frame = CGRectMake(0, 2, self.contentView.frame.size.width, self.contentView.frame.size.height - 4);
    
    float startXPos = 5;
    float startYPos = 0;
    float fullWidth = (self.containerView.frame.size.width*2/3) - (startXPos*2);
    float fullHeight = self.containerView.frame.size.height- (startYPos*2);
    float singleLabelHeight = fullHeight/4;
    
    self.headerLabel.frame = CGRectMake(startXPos, startYPos, fullWidth, singleLabelHeight);
    self.timeSecLabel.frame = CGRectMake(startXPos, singleLabelHeight, fullWidth, singleLabelHeight);
    self.timeLabel.frame = CGRectMake(startXPos, singleLabelHeight*2, fullWidth, singleLabelHeight);
    self.carTypelabel.frame = CGRectMake(startXPos, singleLabelHeight*3, fullWidth, singleLabelHeight);
    
    self.imageView.frame = CGRectMake(fullWidth, startYPos + 5, self.contentView.frame.size.width - (fullWidth + 10), fullHeight - 10);
 }

@end
