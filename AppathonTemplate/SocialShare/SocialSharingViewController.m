//
//  SocialSharingViewController.m
//  AppathonTemplate
//
//  Created by Raghunathan on 2/7/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import <Social/Social.h>
#import "SocialSharingViewController.h"
#import "SocialShare.h"

@interface SocialSharingViewController ()

@property (nonatomic, strong) SocialShare *socialShare;

@end

@implementation SocialSharingViewController

#pragma mark - Memory warning methods

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View life cycle methods

- (void)loadView
{
    self.socialShare = [[SocialShare alloc] init];
    self.view = self.socialShare;
    
    //[self.shareView.signUpButton addTarget:self action:@selector(signUpNewUser:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UIBarButtonItem *postOnFaceBook = [[UIBarButtonItem alloc] initWithTitle:@"Post" style:UIBarButtonItemStyleDone target:self action:@selector(postOnFacebook:)];
//    
//    self.navigationItem.rightBarButtonItem = postOnFaceBook;
    
    [self.socialShare.facebookPostButton addTarget:self action:@selector(postOnFacebook:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.socialShare.twitterPostButton addTarget:self action:@selector(postToTwitter:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.socialShare.selectedImageView setImage:[UIImage imageNamed:@"Google"]];
}

#pragma mark - Action methods

- (void)postOnFacebook:(UIButton *)sender
{
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [controller setInitialText:self.socialShare.commentTextView.text];
        [controller addImage:[UIImage imageNamed:@"Google"]];
        
        [self presentViewController:controller animated:YES completion:Nil];
        
    }
}

- (IBAction)postToTwitter:(id)sender
{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:@"Great fun here."];
        [tweetSheet addImage:[UIImage imageNamed:@"Google"]];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    }
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
