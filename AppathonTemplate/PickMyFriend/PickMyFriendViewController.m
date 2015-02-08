//
//  PickMyFriendViewController.m
//  AppathonTemplate
//
//  Created by inxs tech on 08/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "PickMyFriendViewController.h"
#import "PickMyFriendView.h"


@interface PickMyFriendViewController ()<BaseViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate>
@property(nonatomic, strong)PickMyFriendView *pickMyFriendView;
@property(nonatomic, strong)NSArray *aryLocations;
@property(nonatomic, strong)NSDateFormatter *dateFormatter;
@end

@implementation PickMyFriendViewController
#pragma mark - View life cycle methods
- (void)loadView
{
    self.pickMyFriendView = [[PickMyFriendView alloc] init];
    self.pickMyFriendView.delegate = self;
    self.view = self.pickMyFriendView;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"dd/MM/yyyy"];
    self.aryLocations = [NSArray arrayWithObjects:@"one", @"Bangalore", @"three", nil];
    self.pickMyFriendView.locationPicker.delegate = self;
    self.pickMyFriendView.locationPicker.dataSource = self;
    [self.pickMyFriendView.locationPicker reloadAllComponents];
    [self.pickMyFriendView.btnDone addTarget:self action:@selector(btnDonePressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.pickMyFriendView.btnLocation addTarget:self action:@selector(btnLocationPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.pickMyFriendView.btnDate addTarget:self action:@selector(btnDatePressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.pickMyFriendView.btnTime addTarget:self action:@selector(btnTimePressed) forControlEvents:UIControlEventTouchUpInside];
}

#define kOFFSET_FOR_KEYBOARD 40.0

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
    [self setViewMovedUp:YES];
    //    if ([sender isEqual:mailTf])
    //    {
    //        //move the main view, so that the keyboard does not hide it.
    //        if  (self.view.frame.origin.y >= 0)
    //        {
    //            [self setViewMovedUp:YES];
    //        }
    //    }
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

#pragma mark TargetMethods
- (void)btnLocationPressed
{
    self.pickMyFriendView.datePicker.hidden = YES;
    self.pickMyFriendView.timePicker.hidden = YES;
    self.pickMyFriendView.locationPicker.hidden = NO;
}
- (void)btnDatePressed
{
    self.pickMyFriendView.datePicker.hidden = NO;
    self.pickMyFriendView.timePicker.hidden = YES;
    self.pickMyFriendView.locationPicker.hidden = YES;
}
- (void)btnTimePressed
{
    self.pickMyFriendView.datePicker.hidden = YES;
    self.pickMyFriendView.timePicker.hidden = NO;
    self.pickMyFriendView.locationPicker.hidden = YES;
}
- (void)btnDonePressed
{
    if (self.pickMyFriendView.datePicker.hidden == NO) {
        self.pickMyFriendView.datePicker.hidden = YES;
        [self.dateFormatter setDateFormat:@"dd/MM/yyyy"];
        self.pickMyFriendView.lblDate.text = [self.dateFormatter stringFromDate:self.pickMyFriendView.timePicker.date];
    }else if (self.pickMyFriendView.timePicker.hidden == NO) {
        self.pickMyFriendView.timePicker.hidden = YES;
        [self.dateFormatter setDateFormat:@"hh:mm"];
        self.pickMyFriendView.lblTime.text = [self.dateFormatter stringFromDate:self.pickMyFriendView.datePicker.date];
    }else if (self.pickMyFriendView.locationPicker.hidden == NO) {
        self.pickMyFriendView.locationPicker.hidden = YES;
        self.pickMyFriendView.lblLocation.text = [self.aryLocations objectAtIndex:[self.pickMyFriendView.locationPicker selectedRowInComponent:0]];
    }else {
        NSLog(@"Go to next page...");
    }
}

#pragma mark UIPickerViewDataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.aryLocations count];
}

#pragma mark UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.aryLocations objectAtIndex:row];
}
@end