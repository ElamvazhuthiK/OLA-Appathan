//
//  InitialViewController.m
//  AppathonTemplate
//
//  Created by Raghunathan on 2/7/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "InitialViewController.h"
#import "InitialView.h"
#import "SignUpViewController.h"
#import "LoginViewController.h"


#import "PickMyFriendViewController.h"
@interface InitialViewController ()

@property (nonatomic,strong) InitialView *iniView;
@property (nonatomic,strong) LoginViewController *loginVC;
@property (nonatomic,strong) SignUpViewController *signupVC;
@property (nonatomic,strong) UIViewController *childViewCtrl;
@end

@implementation InitialViewController

- (void)loadView
{
    self.iniView = [[InitialView alloc] init];
    self.iniView.backgroundColor = [UIColor redColor];
    self.view = self.iniView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.iniView.loginBtn  addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.iniView.signUpBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnClicked:(UIButton *)sender
{
    
    PickMyFriendViewController *picMyFriendVC = [[PickMyFriendViewController alloc] init];
    [self.navigationController pushViewController:picMyFriendVC animated:YES];
    
    return;
    if (self.childViewCtrl) {
        [self.childViewCtrl.view removeFromSuperview];
        [self.childViewCtrl removeFromParentViewController];
    }
    if (sender == self.iniView.loginBtn)
    {
        if(self.loginVC == nil)
        {
            self.loginVC  = [[LoginViewController alloc] init];
            self.loginVC.view.frame = [[UIScreen mainScreen] bounds];
        }
        self.childViewCtrl = self.loginVC;
    }
    else
    {
        if (self.signupVC == nil)
        {
            self.signupVC = [[SignUpViewController alloc] init];
            self.signupVC.view.frame = [[UIScreen mainScreen] bounds];
        }
        self.childViewCtrl = self.signupVC;
        
    }
    
    CGRect frame = self.childViewCtrl.view.frame;
    self.childViewCtrl.view.frame = CGRectMake(0, frame.size.height, frame.size.width, frame.size.height);
    [self addChildViewController:self.childViewCtrl];
    [self.iniView addSubview:self.childViewCtrl.view];
    [self didMoveToParentViewController:self.childViewCtrl];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.childViewCtrl.view.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
