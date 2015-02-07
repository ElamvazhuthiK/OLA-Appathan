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
#import "Encryptor.h"

@interface SignUpViewController ()<SignUpModelDelegate>

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
    self.signUpModel = [[SignUpModel alloc] init];
    self.signUpModel.delegate = self;
    self.view = self.signUpView;
    
    [self.signUpView.signUpButton addTarget:self action:@selector(signUpNewUser:) forControlEvents:UIControlEventTouchUpInside];
    
    if ([[AppData getObject] username] != nil) {
        self.signUpView.userNameTextField.text = [[AppData getObject] username];
    }
    
    if ([[AppData getObject] password] != nil) {
        self.signUpView.userNameTextField.text = [[Encryptor encryptor] decryptData:[[[AppData getObject] password] dataUsingEncoding:NSUTF8StringEncoding] withKey:ENCRYPTION_KEY];
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Action methods

- (void)signUpNewUser:(UIButton *)sender
{
//    if (self.signUpView.userEmailTextField.text.length > 0 && self.signUpView.passwordTextField.text.length > 0 && self.signUpView.mobileNumberOfUserTextField.text.length > 0 && self.signUpView.userNameTextField.text.length > 0)
    {
//        @property(nonatomic, strong) NSString *email;
//        @property(nonatomic, strong) NSString *password;
//        @property(nonatomic, strong) NSString *name;
//        @property(nonatomic, strong) NSString *mobile;
//        @property(nonatomic, strong) NSString *source;
//        @property(nonatomic, strong) NSString *device_id;
        SignUpRequest *signUpRequest = [[SignUpRequest alloc] init];
        signUpRequest.email = self.signUpView.userEmailTextField.text;
        signUpRequest.password =  [[NSString alloc] initWithData:[[Encryptor encryptor] encryptString:self.signUpView.passwordTextField.text withKey:ENCRYPTION_KEY] encoding:NSUTF8StringEncoding];
        signUpRequest.name = self.signUpView.userNameTextField.text;
        signUpRequest.mobile = self.signUpView.mobileNumberOfUserTextField.text;
        
        signUpRequest.email = @"vazhuthik@gmail.com";
        
        Encryptor *enc = [Encryptor encryptor];
        NSData *data = [enc encryptString:@"kvazhuthi" withKey:ENCRYPTION_KEY];
        NSLog(@"Check enc %@", [enc decryptData:data withKey:ENCRYPTION_KEY]);
        
        signUpRequest.password =  [[NSString alloc] initWithData:[[Encryptor encryptor] encryptString:@"kvazhuthi" withKey:ENCRYPTION_KEY] encoding:NSUTF16StringEncoding];
        NSLog(@"password %@", signUpRequest.password);
        
        signUpRequest.name = @"Elamvazhuthi";
        signUpRequest.mobile = @"8754469970";
        
        
        [self.signUpModel sendRequest:signUpRequest];
    }
//    else
//    {
//        UIAlertView *missedRequieredFields = [[UIAlertView alloc] initWithTitle:@"Missing required fields" message:@"Please make sure all requiered fields are given" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//        
//        [missedRequieredFields show];
//    }
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
#pragma mark SignUpModel delegate
- (void)signUpSuccess
{
    NSLog(@"signUpSuccess");
    [[AppData getObject] setUsername:self.signUpView.userNameTextField.text];
    [[AppData getObject] setUsername:[[NSString alloc] initWithData:[[Encryptor encryptor] encryptString:@"kvazhuthi" withKey:ENCRYPTION_KEY] encoding:NSUTF16StringEncoding]];
}
@end
