//
//  UIButton+Button.h
//  AppathonTemplate
//
//  Created by abhilash on 07/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Button)

- (id)initWithTitle:(NSString *) titleString andBackgroundImage:(NSString *) bgImageName andTextColor:(UIColor *) textColor;

-(id) initWithButtonOnMachineInformationFrame:(CGRect)frame andTitle:(NSString*) title andTarget:(id)target selector:(SEL)action;

@end
