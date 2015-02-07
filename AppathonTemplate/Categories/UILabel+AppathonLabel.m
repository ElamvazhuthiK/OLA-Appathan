//
//  UILabel+AppathonLabel.m
//  AppathonTemplate
//
//  Created by abhilash on 07/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "UILabel+AppathonLabel.h"

@implementation UILabel (AppathonLabel)

- (id)initWithTextAlignment:(NSTextAlignment) textAlignment andTextColor:(UIColor *) textColor andTextFont:(UIFont *) textFont
{
    self = [super init];
    
    if (self)
    {
        [self setTextColor:textColor];
        [self setFont:textFont];
        [self setTextAlignment:textAlignment];
    }
    return self;
}

@end
