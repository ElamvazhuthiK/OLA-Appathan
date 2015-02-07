//
//  SignUpViewController.m
//  AppathonTemplate
//
//  Created by inxs tech on 07/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "SignUpViewController.h"
#import "SignView.h"
#import "SignUpModel.h"

@interface SignUpViewController ()

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
    self.view = self.signUpView;
    
    [self.signUpView.signUpButton addTarget:self action:@selector(signUpNewUser:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Action methods

- (void)signUpNewUser:(UIButton *)sender
{
    if (self.signUpView.userEmailTextField.text.length > 0 && self.signUpView.passwordTextField.text.length > 0 && self.signUpView.mobileNumberOfUserTextField.text.length > 0 && self.signUpView.userNameTextField.text.length > 0)
    {
//        @property(nonatomic, strong) NSString *email;
//        @property(nonatomic, strong) NSString *password;
//        @property(nonatomic, strong) NSString *name;
//        @property(nonatomic, strong) NSString *mobile;
//        @property(nonatomic, strong) NSString *source;
//        @property(nonatomic, strong) NSString *device_id;
        loginRequest.email = self.signUpView.userEmailTextField.text;
        loginRequest.password = self.signUpView.passwordTextField.text;
        loginRequest.email = self.signUpView.mobileNumberOfUserTextField.text;
        loginRequest.email = self.signUpView.userEmailTextField.text;

        
        [self.signUpModel sendRequest:]
    }
    else
    {
        UIAlertView *missedRequieredFields = [[UIAlertView alloc] initWithTitle:@"Missing required fields" message:@"Please make sure all requiered fields are given" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [missedRequieredFields show];
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
