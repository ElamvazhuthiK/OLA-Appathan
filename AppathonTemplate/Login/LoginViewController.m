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
#import "Encryptor.h"
//#import "SignUpViewController.h"

@interface LoginViewController ()<LoginViewDelegate>
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
    self.loginView.delegate = self;
    self.view = self.loginView;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.loginView.submitButton addTarget:self action:@selector(submitUserCredientilasToLogin:) forControlEvents:UIControlEventTouchUpInside];
    
//    [self.loginView.signUpButton addTarget:self action:@selector(signUpNewUser:) forControlEvents:UIControlEventTouchUpInside];
    
    if ([[AppData getObject] username] != nil) {
        self.loginView.userEmailTextField.text = [[AppData getObject] username];
    }
    if ([[AppData getObject] password] != nil) {
        self.loginView.passwordTextField.text = [[Encryptor encryptor] decryptData:[[[AppData getObject] password] dataUsingEncoding:NSUTF8StringEncoding] withKey:ENCRYPTION_KEY];
    }
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
//    SignUpViewController *signUpViewController = [[SignUpViewController alloc] init];
//    [self.navigationController pushViewController:signUpViewController animated:YES];
}
- (void)removeView
{
    CGRect frame = self.view.frame;
    [UIView animateWithDuration:0.5 animations:^{
        self.view.frame = CGRectMake(0, frame.size.height, frame.size.width, frame.size.height);
    } completion:^(BOOL finished){
        if (finished) {
            [self.view removeFromSuperview];
            [self removeFromParentViewController];
        }
    }];
}
#define kOFFSET_FOR_KEYBOARD 80.0

-(void)keyboardWillShow {
    // Animate the current view out of the way
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)keyboardWillHide {
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)sender
{
//    if ([sender isEqual:mailTf])
    {
        //move the main view, so that the keyboard does not hide it.
        if  (self.view.frame.origin.y >= 0)
        {
            [self setViewMovedUp:YES];
        }
    }
}

//method to move the view up/down whenever the keyboard is shown/dismissed
-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    // unregister for keyboard notifications while not visible.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}
@end
