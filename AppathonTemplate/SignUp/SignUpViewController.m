//
//  SignUpViewController.m
//  AppathonTemplate
//
//  Created by inxs tech on 07/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "SignUpViewController.h"
#import "SocialSharingViewController.h"
#import "SelectedTripDetailsViewController.h"
#import "SignView.h"
#import "SignUpModel.h"
#import "Encryptor.h"

@interface SignUpViewController ()<SignUpModelDelegate, BaseViewDelegate>

@property (nonatomic, strong) SignView *signUpView;
@property (nonatomic, strong) SignUpModel *signUpModel;

@end
@implementation SignUpViewController

#pragma mark - Memory warning methods

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View life cycle methods

- (void)loadView
{
    self.signUpView = [[SignView alloc] init];
    [self.view addSubview:self.signUpView];
    [self.signUpView.signUpButton addTarget:self action:@selector(signUpNewUser:) forControlEvents:UIControlEventTouchUpInside];
    
    if ([[AppData getObject] username] != nil) {
        self.signUpView.userNameTextField.text = [[AppData getObject] username];
    }
    
    if ([[AppData getObject] password] != nil) {
        self.signUpView.userNameTextField.text = [[Encryptor encryptor] decryptData:[[[AppData getObject] password] dataUsingEncoding:NSUTF8StringEncoding] withKey:ENCRYPTION_KEY];
    }
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Action methods

- (void)signUpNewUser:(UIButton *)sender
{
    SelectedTripDetailsViewController *selTripvc = [[SelectedTripDetailsViewController alloc] init];
    [self.navigationController pushViewController:selTripvc animated:YES];
}
@end
