//
//  SummaryViewCell.m
//  AppathonTemplate
//
//  Created by Raghunathan on 2/7/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "SummaryViewCell.h"

@interface SummaryViewCell ()

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
    self.headerLabel = [[UILabel alloc]initWithText:@"Test" textAlignment:NSTextAlignmentLeft textColor:[UIColor blackColor] font:[UIFont fontWithName:@COMMONBOLDFONT size:18.0]];
    [self.contentView addSubview:self.headerLabel];
    
    self.timeSecLabel = [[UILabel alloc]initWithText:@"Test" textAlignment:NSTextAlignmentLeft textColor:[UIColor blackColor] font:[UIFont fontWithName:@COMMONGFONT size:18.0]];
    [self.contentView addSubview:self.timeSecLabel];
    
    self.timeLabel = [[UILabel alloc]initWithText:@"Test" textAlignment:NSTextAlignmentLeft textColor:[UIColor blackColor] font:[UIFont fontWithName:@COMMONGFONT size:18.0]];
    [self.contentView addSubview:self.timeLabel];
    
    self.carTypelabel = [[UILabel alloc]initWithText:@"Test" textAlignment:NSTextAlignmentLeft textColor:[UIColor blackColor] font:[UIFont fontWithName:@COMMONGFONT size:14.0]];
    [self.contentView addSubview:self.carTypelabel];
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image"] bgColor:[UIColor greenColor]];
    self.imageView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.imageView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    float startXPos = 0;
    float startYPos = 0;
    float fullWidth = (self.contentView.frame.size.width*2/3) - (startXPos*2);
    float fullHeight = self.contentView.frame.size.height- (startYPos*2);
    float singleLabelHeight = fullHeight/4;
    
    self.headerLabel.frame = CGRectMake(startXPos, startYPos, fullWidth, singleLabelHeight);
    self.timeSecLabel.frame = CGRectMake(startXPos, singleLabelHeight, fullWidth, singleLabelHeight);
    self.timeLabel.frame = CGRectMake(startXPos, singleLabelHeight*2, fullWidth, singleLabelHeight);
    self.carTypelabel.frame = CGRectMake(startXPos, singleLabelHeight*3, fullWidth, singleLabelHeight);
    
    self.imageView.frame = CGRectMake(fullWidth, startYPos + 5, self.contentView.frame.size.width - (fullWidth + 10), fullHeight - 10);
 }

@end
