//
//  UITextField+TextField.m
//  AppathonTemplate
//
//  Created by abhilash on 07/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "UITextField+TextField.h"

@implementation UITextField (TextField)

- (id)initWithPlaceholder:(NSString *) placeholderString andBackgroundColor:(UIColor *) backGroundColor andTextColor:(UIColor *) textColor andTextAlignment:(NSTextAlignment) textAlignment andBorderStyle:(UITextBorderStyle) borderStyle
{
    self = [super init];
    
    if (self)
    {
        [self setPlaceholder:placeholderString];
        [self setTextAlignment:textAlignment];
        [self setBorderStyle:borderStyle];
        [self setBackgroundColor:backGroundColor];
        [self setTextColor:textColor];
    }
    return self;
}

@end
