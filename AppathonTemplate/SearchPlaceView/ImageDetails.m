//
//  ImageDetails.m
//  AppathonTemplate
//
//  Created by Raghunathan on 2/8/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "ImageDetails.h"

@interface ImageDetails ()

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *headerLabel,*detail;


@end

@implementation ImageDetails

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
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Picture47.png"] bgColor:[UIColor clearColor]];
    self.imageView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.imageView];
    
    self.headerLabel = [[UILabel alloc]initWithText:@"Majestic- ISKAN templehvdabdvnasbdvnbasvdnbvasdnbvasnbdvnbasvdnbavsdnbvasnbdvnabsfv" textAlignment:NSTextAlignmentLeft textColor:[UIColor blackColor] font:[UIFont fontWithName:@COMMONGFONT size:11.0]];
    [self.contentView addSubview:self.headerLabel];
    
    self.detail = [[UILabel alloc]initWithText:@"33 mins without Traffic gfdhhsdhasvdfhjgafhaehfhjaejfbamfeveasfugwefjbejfhbsigbsorgbsrbhkbjhbhuageugfhb" textAlignment:NSTextAlignmentLeft textColor:[UIColor grayColor] font:[UIFont fontWithName:@COMMONGFONT size:9.0]];
    self.detail.numberOfLines = 0;
    [self.contentView addSubview:self.detail];

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    float startXPos = 5;
    float startYPos = 5;
    float fullWidth = (self.contentView.frame.size.width) - (startXPos*2);
    float fullHeight = self.contentView.frame.size.height- (startYPos*2);
    
    self.imageView.frame = CGRectMake(startXPos, startYPos, fullWidth/4, fullHeight);
    
    self.headerLabel.frame = CGRectMake(self.imageView.frame.origin.x + self.imageView.frame.size.width + 5 , startYPos, fullWidth - (self.imageView.frame.origin.x + self.imageView.frame.size.width + 5), fullHeight/4);
    self.detail.frame = CGRectMake(self.imageView.frame.origin.x + self.imageView.frame.size.width + 5, self.headerLabel.frame.origin.y + self.headerLabel.frame.size.height, fullWidth- (self.imageView.frame.origin.x + self.imageView.frame.size.width + 5), fullHeight - ( self.headerLabel.frame.origin.y + self.headerLabel.frame.size.height));
    
    
}


@end
