//
//  WidgetView.m
//  AppathonTemplate
//
//  Created by Raghunathan on 2/7/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "WidgetView.h"

@interface WidgetView ()



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
    self.backgroundColor = UIColorFromRGB(0x3D3936);
   
    self.titleLabel = [[UILabel alloc] initWithText:@"" textAlignment:NSTextAlignmentCenter textColor:UIColorFromRGB(0xC7C2BF) font:[UIFont fontWithName:@COMMONGFONT size:16]];
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.minimumScaleFactor = 5;
    
    [self addSubview:self.titleLabel];
    
    self.bodyLabel = [[UILabel alloc] initWithText:@"" textAlignment:NSTextAlignmentCenter textColor:[UIColor whiteColor] font:[UIFont fontWithName:@COMMONBOLDFONT size:21]];
    [self addSubview:self.bodyLabel];
    
    self.leftSepLine = [[UILabel alloc] initWithText:@"" textAlignment:NSTextAlignmentCenter textColor:[UIColor whiteColor] font:[UIFont fontWithName:@COMMONBOLDFONT size:21]];
    self.leftSepLine.hidden = YES;
    self.leftSepLine.backgroundColor = UIColorFromRGB(0xC7C2BF);
    [self addSubview:self.leftSepLine];
    
    self.rightSepLine = [[UILabel alloc] initWithText:@"" textAlignment:NSTextAlignmentCenter textColor:[UIColor whiteColor] font:[UIFont fontWithName:@COMMONBOLDFONT size:21]];
    self.rightSepLine.hidden = YES;
    self.rightSepLine.backgroundColor = UIColorFromRGB(0xC7C2BF);
    [self addSubview:self.rightSepLine];
    
    self.bottomHighLightLabel = [[UILabel alloc] initWithText:@"" textAlignment:NSTextAlignmentCenter textColor:[UIColor whiteColor] font:[UIFont fontWithName:@COMMONBOLDFONT size:21]];
    self.bottomHighLightLabel.hidden = YES;
    self.bottomHighLightLabel.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.bottomHighLightLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    float startXPos = 0;
    float startYPos = 5;
    float fullWidth = self.frame.size.width - (startXPos*2);
    float fullHeight = self.frame.size.height- (startYPos*2);
    
    self.titleLabel.frame = CGRectMake(startXPos, startYPos, fullWidth, fullHeight/3);
    self.bodyLabel.frame = CGRectMake(startXPos, self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height , fullWidth, fullHeight -(self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height));
    
    self.leftSepLine.frame = CGRectMake(0, 1, 0.5, fullHeight);
    self.rightSepLine.frame = CGRectMake(self.frame.size.width - 2, 1, 0.5, fullHeight);
    self.bottomHighLightLabel.frame = CGRectMake(self.frame.size.width / 4, self.frame.size.height - 8, self.frame.size.width / 2, 3);

}

@end
