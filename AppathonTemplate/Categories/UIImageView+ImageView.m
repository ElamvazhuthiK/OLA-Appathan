//
//  UIImageView+ImageView.m
//  AppathonTemplate
//
//  Created by Raghunathan on 2/7/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "UIImageView+ImageView.h"

@implementation UIImageView (ImageView)

- (UIImageView *)initWithImage:(UIImage *)image bgColor:(UIColor *)bgColor
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.backgroundColor = [UIColor clearColor];
    
    return imageView;
}

@end
