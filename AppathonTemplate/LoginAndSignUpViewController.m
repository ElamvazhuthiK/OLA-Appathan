//
//  LoginAndSignUpViewController.m
//  AppathonTemplate
//
//  Created by abhilash on 08/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "LoginAndSignUpViewController.h"

#define SCROLLVIEW_CONTENT_HEIGHT 460
#define SCROLLVIEW_CONTENT_WIDTH 320

CGFloat animatedDistance;
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;
static const CGFloat LANDSCAPE_KEYBOARD_HEIGHT = 162;

@interface LoginAndSignUpViewController ()
{
    CGPoint point;
    CGPoint startingPoint;
    int viewSelector;
    UIView *dummyGrayView, *commonView;
}

@end
@implementation LoginAndSignUpViewController
#pragma mark - Memory methods

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View life cycle methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    backgroundButton = [[UIButton alloc] initWithButtonOnMachineInformationFrame:self.view.frame andTitle:nil andTarget:self selector:@selector(backgroundButtonAction:)];
    
    self.navigationController.navigationBar.hidden = YES;
    [self.view addSubview:backgroundButton];
    
    [self loginViewConfiguration];
    [self signupViewConfiguration];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backGround"]];
    
    //To add a gray color view animated from bottom to top
    dummyGrayView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)];
    dummyGrayView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:dummyGrayView];
    
    // To set font Gotham-Light for all fields.
    signupLabel.font =  [UIFont fontWithName:@"Gotham-Light" size:18];
    loginLabel.font =  [UIFont fontWithName:@"Gotham-Light" size:18];
    
    nextButton.titleLabel.font = [UIFont fontWithName:@"Gotham-Light" size:18];
    doneButton.titleLabel.font = [UIFont fontWithName:@"Gotham-Light" size:18];
    
    
    signupEmailField.font = [UIFont fontWithName:@"Gotham-Medium" size:12];
    signupPasswordField.font = [UIFont fontWithName:@"Gotham-Medium" size:12];
    
    loginPasswordField.font = [UIFont fontWithName:@"Gotham-Medium" size:12];
    loginUsernameField.font = [UIFont fontWithName:@"Gotham-Medium" size:12];
    forgotPasswordBtn.titleLabel.font =  [UIFont fontWithName:@"Gotham-Medium" size:12];
    //loginPasswordField.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    
    
    //Add tap Gesture to signup and login Buttons views
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    [signupBtnView addGestureRecognizer:tap1];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    [loginBtnView addGestureRecognizer:tap2];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    //To set the frames in original possition
//    dummyGrayView.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
//    
//    loginView.frame = CGRectMake(loginView.frame.origin.x, self.view.frame.size.height,loginView.frame.size.width, loginView.frame.size.height);
//    loginBtnView.frame = CGRectMake(loginBtnView.frame.origin.x, self.view.frame.size.height-loginBtnView.frame.size.height, loginBtnView.frame.size.width,  loginBtnView.frame.size.height);
//    
//    signupView.frame = CGRectMake(signupView.frame.origin.x, self.view.frame.size.height, signupView.frame.size.width,  signupView.frame.size.height);
//    signupBtnView.frame = CGRectMake(signupBtnView.frame.origin.x, self.view.frame.size.height-signupBtnView.frame.size.height, signupBtnView.frame.size.width,  signupBtnView.frame.size.height);
//    
//    loginView.alpha = 1;
//    loginBtnView.alpha = 1;
//    signupView.alpha = 1;
//    signupBtnView.alpha = 1;
}


-(void)singleTap:(UITapGestureRecognizer*)gestureRecogniser
{
    for (UITextField *field in signupView.subviews) {
        [field resignFirstResponder];
    }
    for (UITextField *field in loginView.subviews) {
        [field resignFirstResponder];
    }
    
    UIView *view = gestureRecogniser.view;
    
    
    [self animationViewsWithSelectedView:view];
}

- (void)animationViewsWithSelectedView:(UIView*)view
{
    //Tap on SIGNUP VIEW
    if (view.tag == 3)
    {
        
        signupBtnView.hidden = NO;
        if (!(signupView.frame.origin.y == self.view.frame.size.height - signupView.frame.size.height) )
        {
            loginBtnView.hidden = YES;
            commonView = signupBtnView;
            [UIView beginAnimations:@"left" context:NULL];
            signupView.frame = CGRectMake(signupView.frame.origin.x, self.view.frame.size.height - signupView.frame.size.height, signupView.frame.size.width,  signupView.frame.size.height);
            signupBtnView.frame = CGRectMake(signupBtnView.frame.origin.x, self.view.frame.size.height- signupView.frame.size.height- signupBtnView.frame.size.height, signupBtnView.frame.size.width,  signupBtnView.frame.size.height);
            [UIView commitAnimations];
        }
        else
        {
            loginBtnView.hidden = NO;
            [UIView beginAnimations:@"left" context:NULL];
            signupView.frame = CGRectMake(signupView.frame.origin.x, self.view.frame.size.height, signupView.frame.size.width,  signupView.frame.size.height);
            signupBtnView.frame = CGRectMake(signupBtnView.frame.origin.x, self.view.frame.size.height-signupBtnView.frame.size.height, signupBtnView.frame.size.width,  signupBtnView.frame.size.height);
            [UIView commitAnimations];
        }
    }
    
    //Tap on LOGIN VIEW
    else if(view.tag == 4)
    {
        loginBtnView.hidden = NO;
        if (!(loginView.frame.origin.y == self.view.frame.size.height -loginView.frame.size.height ))
        {
            signupBtnView.hidden = YES;
            commonView = loginBtnView;
            //float distenceToMove = self.view.frame.size.height-(self.view.frame.size.height -loginView.frame.size.height);
            [UIView beginAnimations:@"left" context:NULL];
            loginView.frame = CGRectMake(loginView.frame.origin.x, self.view.frame.size.height- loginView.frame.size.height,loginView.frame.size.width, loginView.frame.size.height);
            loginBtnView.frame = CGRectMake(loginBtnView.frame.origin.x, self.view.frame.size.height-loginView.frame.size.height-loginBtnView.frame.size.height, loginBtnView.frame.size.width,  loginBtnView.frame.size.height);
            [UIView commitAnimations];
        }
        else
        {
            signupBtnView.hidden = NO;
            //float distenceToMove = self.view.frame.size.height-(self.view.frame.size.height -loginView.frame.size.height);
            [UIView beginAnimations:@"left" context:NULL];
            loginView.frame = CGRectMake(loginView.frame.origin.x, self.view.frame.size.height,loginView.frame.size.width, loginView.frame.size.height);
            loginBtnView.frame = CGRectMake(loginBtnView.frame.origin.x, self.view.frame.size.height-loginBtnView.frame.size.height, loginBtnView.frame.size.width,  loginBtnView.frame.size.height);
            
            [UIView commitAnimations];
            
        }
    }
}

#pragma mark-loginViewmethods

- (IBAction)loginDoneAction
{
    [self.view endEditing:YES];
}

- (void)backgroundButtonAction:(UIButton *)sender
{
    [self animationViewsWithSelectedView:commonView];
}

#pragma mark - View configuration

- (void)loginViewConfiguration
{
    // Login view configuration.
    loginBtnView = [[UIView alloc] initWithFrame:CGRectMake(160, 507,160, 61)];
    [loginBtnView setTag:4];
    loginLabel = [[UILabel alloc] initWithFrame:CGRectMake(42, 24, 76, 21)];
    loginBtnView.backgroundColor = [UIColor loginBackgroundColor];
    loginLabel.text = @"LOGIN";
    [loginBtnView addSubview:loginLabel];
    [self.view addSubview:loginBtnView];
    
    loginView = [[UIView alloc] initWithFrame:CGRectMake(0, 568, 320, 214)];
    loginView.backgroundColor = [UIColor signUpBackgroundColor];
    
    doneButton = [[UIButton alloc] initWithButtonOnMachineInformationFrame:CGRectMake(0, 142, 320, 72) andTitle:@"DONE" andTarget:self selector:@selector(loginDoneAction)];
    doneButton.backgroundColor = [UIColor blackColor];
    [loginView addSubview:doneButton];
    
    loginUsernameField = [[UITextField alloc] initWithPlaceholder:@"Email ID" andBackgroundColor:[UIColor whiteColor] andTextColor:[UIColor blueColor] andTextAlignment:NSTextAlignmentLeft andBorderStyle:UITextBorderStyleRoundedRect];
    [loginUsernameField setFrame:CGRectMake(20, 11, 280, 33)];
    [loginView addSubview:loginUsernameField];
    
    loginPasswordField = [[UITextField alloc] initWithPlaceholder:@"Password" andBackgroundColor:[UIColor whiteColor] andTextColor:[UIColor blueColor] andTextAlignment:NSTextAlignmentLeft andBorderStyle:UITextBorderStyleRoundedRect];
    loginPasswordField.secureTextEntry = YES;
    [loginPasswordField setFrame:CGRectMake(20, 55, 280, 33)];
    [loginView addSubview:loginPasswordField];
    
    forgotPasswordBtn = [[UIButton alloc] initWithTitle:@"Forgot password?" andBackgroundImage:nil andTextColor:[UIColor darkGrayColor]];
    [forgotPasswordBtn setFrame:CGRectMake(20, 99, 280, 33)];
    [loginView addSubview:forgotPasswordBtn];
    
    [self.view addSubview:loginView];
}

- (void)signupViewConfiguration
{
    // Sign up view configuration.
    signupBtnView = [[UIView alloc] initWithFrame:CGRectMake(0, 507, 160, 61)];
    [signupBtnView setTag:3];
    signupBtnView.backgroundColor = [UIColor signUpBackgroundColor];
    signupLabel = [[UILabel alloc] initWithFrame:CGRectMake(42, 24, 76, 21)];
    signupLabel.text = @"SIGNUP";
    [signupBtnView addSubview:signupLabel];
    [self.view addSubview:signupBtnView];
    
    signupView = [[UIView alloc] initWithFrame:CGRectMake(0, 568, 320, 294)];
    signupView.backgroundColor = [UIColor signUpBackgroundColor];
    signupEmailField = [[UITextField alloc] initWithPlaceholder:@"Email ID" andBackgroundColor:[UIColor whiteColor] andTextColor:[UIColor blueColor] andTextAlignment:NSTextAlignmentLeft andBorderStyle:UITextBorderStyleRoundedRect];
    [signupEmailField setFrame:CGRectMake(20, 11, 280, 33)];
    [signupView addSubview:signupEmailField];
    
    signupPasswordField = [[UITextField alloc] initWithPlaceholder:@"Password" andBackgroundColor:[UIColor whiteColor] andTextColor:[UIColor blueColor] andTextAlignment:NSTextAlignmentLeft andBorderStyle:UITextBorderStyleRoundedRect];
    signupPasswordField.secureTextEntry = YES;
    [signupPasswordField setFrame:CGRectMake(20, 55, 280, 33)];
    [signupView addSubview:signupPasswordField];
    
    signUpConfirmPassword = [[UITextField alloc] initWithPlaceholder:@"Confirm Password" andBackgroundColor:[UIColor whiteColor] andTextColor:[UIColor blueColor] andTextAlignment:NSTextAlignmentLeft andBorderStyle:UITextBorderStyleRoundedRect];
    [signUpConfirmPassword setFrame:CGRectMake(20, 99, 280, 33)];
    [signupView addSubview:signUpConfirmPassword];
    
    signupUsernameField = [[UITextField alloc] initWithPlaceholder:@"Name" andBackgroundColor:[UIColor whiteColor] andTextColor:[UIColor blueColor] andTextAlignment:NSTextAlignmentLeft andBorderStyle:UITextBorderStyleRoundedRect];
    [signupUsernameField setFrame:CGRectMake(20, 142, 280, 33)];
    [signupView addSubview:signupUsernameField];
    
    signupMobileField = [[UITextField alloc] initWithPlaceholder:@"Phone Number" andBackgroundColor:[UIColor whiteColor] andTextColor:[UIColor blueColor] andTextAlignment:NSTextAlignmentLeft andBorderStyle:UITextBorderStyleRoundedRect];
    [signupMobileField setFrame:CGRectMake(20, 185, 280, 33)];
    [signupView addSubview:signupMobileField];
    
    nextButton = [[UIButton alloc] initWithButtonOnMachineInformationFrame:CGRectMake(0, 225, 320, 72) andTitle:@"SignUp" andTarget:self selector:@selector(signupNextAction)];
    nextButton.backgroundColor = [UIColor blackColor];
    [signupView addSubview:nextButton];
    
    [self.view addSubview:signupView];
}

#pragma mark TextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}



- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    //ErrorMsg.text = @"";
    CGRect textFieldRect =[self.view.window convertRect:textField.bounds fromView:textField];
    CGRect viewRect =[self.view.window convertRect:self.view.bounds fromView:self.view];
    
    CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height+100;
    CGFloat numerator =	midline - viewRect.origin.y
    - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    CGFloat denominator =(MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION)* viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
    
    if (heightFraction < 0.0)
    {
        heightFraction = 0.0;
    }
    else if (heightFraction > 1.0)
    {
        heightFraction = 1.0;
    }
    
    UIInterfaceOrientation orientation =[[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
    }
    else
    {
        animatedDistance = floor(LANDSCAPE_KEYBOARD_HEIGHT * heightFraction);
    }
    
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y -= animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
}
- (IBAction)signupNextAction
{
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    [self.view setFrame:viewFrame];
    [UIView commitAnimations];
}

@end
