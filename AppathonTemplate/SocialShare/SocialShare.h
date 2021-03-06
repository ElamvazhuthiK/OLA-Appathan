//
//  SocialShare.h
//  AppathonTemplate
//
//  Created by Raghunathan on 2/7/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "BaseView.h"
#import <Social/Social.h>

@interface SocialShare : BaseView

@property (nonatomic, strong) UITextView *commentTextView;
@property (nonatomic, strong) UIImageView *selectedImageView;

@property(nonatomic, strong)UIButton *facebookPostButton;
@property(nonatomic, strong)UIButton *twitterPostButton;

@end
