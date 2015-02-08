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

-(id) initWithButtonFrame:(CGRect)frame andTitle:(NSString*) title andTarget:(id)target selector:(SEL)action
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Button Title colors for Normal and Highlighted state.
        //[self textColorInNormalAndHighlightedState];
        
        // Button Title.
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitle:title forState:UIControlStateDisabled];
        
        [self setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
        
        // Button text and background alignment.
//        self.titleLabel.font = [UIFont bigBoldFontInFleetSync];
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
//        self.backgroundColor = [UIColor normalBackGroundColor];
        
        //[self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        
        // Exclusive touch enabling.
        [self setExclusiveTouch:YES];
        
        // Button target.
        [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        
        // accessory button adding to button.
        
    }
    return self;
}

@end
