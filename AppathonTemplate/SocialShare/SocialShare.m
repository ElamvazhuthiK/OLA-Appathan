//
//  SocialShare.m
//  AppathonTemplate
//
//  Created by Raghunathan on 2/7/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "SocialShare.h"

@implementation SocialShare

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
    [super createViews];
    
//    self.commentTextView = [[UITextView alloc] init];
//    [self.commentTextView setTextColor:[UIColor blackColor]];
//    [self.commentTextView setBackgroundColor:[UIColor yellowColor]];
//    [self addSubview:self.commentTextView];
    
    self.selectedImageView = [[UIImageView alloc] init];
    
    [self addSubview:self.selectedImageView];
    
    self.facebookPostButton = [[UIButton alloc] initWithTitle:@"Post on FB" andBackgroundImage:@"" andTextColor:[UIColor blueColor]];
    [self addSubview:self.facebookPostButton];
    
    self.twitterPostButton = [[UIButton alloc] initWithTitle:@"Tweet" andBackgroundImage:@"" andTextColor:[UIColor blueColor]];
    [self addSubview:self.twitterPostButton];
    
}

- (void)layoutSubviews
{
    //[self.commentTextView setFrame:CGRectMake(10, 74, 300, 200)];
    [self.selectedImageView setFrame:CGRectMake(10, 74, 300, 300)];
    [self.facebookPostButton setFrame:CGRectMake(10, 384, 300, 30)];
    [self.twitterPostButton setFrame:CGRectMake(10, 424, 300, 30)];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[self.commentTextView resignFirstResponder];
}

@end
