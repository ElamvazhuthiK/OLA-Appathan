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

@interface InitialViewController ()

@property (nonatomic,strong) InitialView *iniView;

@end

@implementation InitialViewController

- (void)loadView
{
    self.iniView = [[InitialView alloc] init];
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
    if (sender == self.iniView.loginBtn)
    {
        LoginViewController *loginVC = [[LoginViewController alloc] init];
        [self navigateToViewController:loginVC];
    }
    else
    {
        SignUpViewController *signupVc = [[SignUpViewController alloc] init];
        [self navigateToViewController:signupVc];
    }
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
