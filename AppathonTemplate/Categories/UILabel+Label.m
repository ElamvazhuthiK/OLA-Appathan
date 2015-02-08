//
//  UILabel+Label.m
//  AppathonTemplate
//
//  Created by Raghunathan on 2/7/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "UILabel+Label.h"

@implementation UILabel (Label)

- (UILabel *)initWithText:(NSString *)text textAlignment:(NSTextAlignment)textAlignment textColor:(UIColor *)color font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = font;
    label.textAlignment = textAlignment;
    label.textColor = color;
    
    return label;
}

@end
