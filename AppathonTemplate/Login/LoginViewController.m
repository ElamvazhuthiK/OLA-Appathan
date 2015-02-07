//
//  LoginViewController.m
//  AppathonTemplate
//
//  Created by inxs tech on 07/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "LoginModel.h"

#import "SignUpViewController.h"

@interface LoginViewController ()
@property (nonatomic, strong)LoginModel *loginModel;
@property (nonatomic, strong)LoginView *loginView;
@end

@implementation LoginViewController

#pragma mark - Memory warning methods

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View life cycle methods

- (void)loadView
{
    self.loginView = [[LoginView alloc] init];
    self.view = self.loginView;
    
    [self.loginView.submitButton addTarget:self action:@selector(submitUserCredientilasToLogin:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.loginView.signUpButton addTarget:self action:@selector(signUpNewUser:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Action methods

- (void)submitUserCredientilasToLogin:(UIButton *) sender
{
    if (self.loginView.userEmailTextField.text.length > 0 && self.loginView.passwordTextField.text.length > 0)
    {
//        LoginRequest *loginRequest = [[LoginRequest alloc] init];
        
//        @property(nonatomic, strong) NSString *email;
//        @property(nonatomic, strong) NSString *password;
//        @property(nonatomic, strong) NSString *name;
//        @property(nonatomic, strong) NSString *mobile;
//        @property(nonatomic, strong) NSString *source;
//        @property(nonatomic, strong) NSString *device_id;
//        loginRequest.email = self.loginView.userEmailTextField.text;
//        loginRequest.password = self.loginView.passwordTextField.text;
//        loginRequest.email = self.loginView.userEmailTextField.text;
//        loginRequest.email = self.loginView.userEmailTextField.text;
        
    }
    else
    {
        UIAlertView *missedRequieredFields = [[UIAlertView alloc] initWithTitle:@"Missing required fields" message:@"Please make sure all requiered fields are given" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [missedRequieredFields show];
    }
}

- (void)signUpNewUser:(UIButton *)sender
{
    SignUpViewController *signUpViewController = [[SignUpViewController alloc] init];
    [self.navigationController pushViewController:signUpViewController animated:YES];
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
