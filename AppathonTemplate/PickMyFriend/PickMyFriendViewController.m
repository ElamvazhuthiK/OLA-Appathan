//
//  PickMyFriendViewController.m
//  AppathonTemplate
//
//  Created by inxs tech on 08/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "PickMyFriendViewController.h"
#import "PickMyFriendView.h"
#import "SummaryViewController.h"
#import "AppDelegate.h"
#import "ProfileViewController.h"

@interface PickMyFriendViewController ()<BaseViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate,UITableViewDataSource,UITableViewDelegate, PickMyFriendViewDelegate, UIImagePickerControllerDelegate>
@property(nonatomic, strong)PickMyFriendView *pickMyFriendView;
@property(nonatomic, strong)NSArray *aryLocations;
@property(nonatomic, strong)NSDateFormatter *dateFormatter;
@end

@implementation PickMyFriendViewController
#pragma mark - View life cycle methods
- (void)loadView
{
    self.pickMyFriendView = [[PickMyFriendView alloc] init];
    self.pickMyFriendView.pickDelegate = self;
    self.view = self.pickMyFriendView;
    
    [self.pickMyFriendView.menuBtn addTarget:self action:@selector(menuList:) forControlEvents:UIControlEventTouchUpInside];
    self.pickMyFriendView.menuListTableView.dataSource = self;
    self.pickMyFriendView.menuListTableView.delegate = self;
    self.pickMyFriendView.menuListTableView.hidden = YES;
    
    self.pickMyFriendView.titleLabel.text = @"Pick my friend";
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    // Do any additional setup after loading the view.
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"dd/MM/yyyy"];
    
    self.aryLocations = [NSArray arrayWithObjects:@"Yeswanthpur",@"Malleswara",@"Ejipura",@"Bellandur",@"Kotur",@"Bargur",@"WhitField",@"Jayanagar",@"Begur",@"Kumbalgodu",@"Bangalore", nil];
    self.pickMyFriendView.locationPicker.delegate = self;
    self.pickMyFriendView.locationPicker.dataSource = self;
    [self.pickMyFriendView.locationPicker reloadAllComponents];
    [self.pickMyFriendView.btnDone addTarget:self action:@selector(btnDonePressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.pickMyFriendView.btnLocation addTarget:self action:@selector(btnLocationPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.pickMyFriendView.btnDate addTarget:self action:@selector(btnDatePressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.pickMyFriendView.btnTime addTarget:self action:@selector(btnTimePressed) forControlEvents:UIControlEventTouchUpInside];
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
        self.pickMyFriendView.lblDate.text = [self.dateFormatter stringFromDate:self.pickMyFriendView.datePicker.date];
    }else if (self.pickMyFriendView.timePicker.hidden == NO) {
        self.pickMyFriendView.timePicker.hidden = YES;
        [self.dateFormatter setDateFormat:@"hh:mm"];
        self.pickMyFriendView.lblTime.text = [self.dateFormatter stringFromDate:self.pickMyFriendView.timePicker.date];
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

#pragma mark - TableView

#pragma mark - Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.pickMyFriendView.mContentListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [self.pickMyFriendView.mContentListArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - Delagate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    if (indexPath.row == 0)
    {
        SummaryViewController *summaryVC = [[SummaryViewController alloc] init];
        
        // Summary view controller.
        UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:summaryVC];
        
        navigationVC.navigationBar.hidden = YES;
        appDelegate.window.rootViewController = navigationVC;
    }
    else if (indexPath.row == 1)
    {
        self.pickMyFriendView.menuListTableView.hidden = YES;
    }
    else if (indexPath.row == 2)
    {
        ProfileViewController *profileVC = [[ProfileViewController alloc] init];
        
        UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:profileVC];
        
        navigationVC.navigationBar.hidden = YES;
        appDelegate.window.rootViewController = navigationVC;
    }
}
#pragma mark - Menu
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.pickMyFriendView.frame = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20);
}
- (void)menuList:(UIButton *) sender
{
    [self.pickMyFriendView bringSubviewToFront:self.pickMyFriendView.menuListTableView];
    if (self.pickMyFriendView.menuListTableView.hidden)
    {
        self.pickMyFriendView.menuListTableView.hidden = NO;
        [self.pickMyFriendView.menuListTableView reloadData];
    }
    else
    {
        self.pickMyFriendView.menuListTableView.hidden = YES;
    }
    
}
#pragma mark - PickMyFriendViewDelegate
- (void)pickMyFriendSelectPhoto
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}
#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo {
    self.pickMyFriendView.imgViewFriend.image = image;
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end
