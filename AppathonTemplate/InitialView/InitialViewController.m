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
#import "SummaryViewController.h"

@interface InitialViewController ()

@property (nonatomic,strong) InitialView *iniView;

@end

@implementation InitialViewController
- (void)loadView
{
    [super loadView];
    self.iniView = [[InitialView alloc] init];
    [self.view addSubview:self.iniView];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.iniView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
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
    SummaryViewController *vc = [[SummaryViewController alloc] init];
    [self navigateToViewController:vc];
    
//    if (sender == self.iniView.loginBtn)
//    {
//        LoginViewController *loginVC = [[LoginViewController alloc] init];
//        [self navigateToViewController:loginVC];
//    }
//    else
//    {
//        SignUpViewController *signupVc = [[SignUpViewController alloc] init];
//        [self navigateToViewController:signupVc];
//    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
