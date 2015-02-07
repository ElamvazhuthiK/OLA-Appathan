//
//  UIButton+Button.m
//  AppathonTemplate
//
//  Created by abhilash on 07/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "UIButton+Button.h"

@implementation UIButton (Button)

- (id)initWithTitle:(NSString *) titleString andBackgroundImage:(NSString *) bgImageName andTextColor:(UIColor *) textColor
{
    self = [super init];
    
    if (self)
    {
        [self setTitleColor:textColor forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
        [self setTitle:titleString forState:UIControlStateNormal];
    }
    return self;
}

@end
