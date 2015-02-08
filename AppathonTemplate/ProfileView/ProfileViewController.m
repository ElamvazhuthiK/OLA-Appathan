//
//  ProfileViewController.m
//  AppathonTemplate
//
//  Created by abhilash on 08/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProfileView.h"
#import "AppDelegate.h"
#import "SummaryViewController.h"
#import "PickMyFriendViewController.h"

@interface ProfileViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) ProfileView *profileView;

@end
@implementation ProfileViewController

#pragma mark - Memory warning methods

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View life cycle methods

- (void)loadView
{
    self.profileView = [[ProfileView alloc] init];
    self.view = self.profileView;
    
    [self.profileView.menuBtn addTarget:self action:@selector(menuList:) forControlEvents:UIControlEventTouchUpInside];
    self.profileView.menuListTableView.dataSource = self;
    self.profileView.menuListTableView.delegate = self;
    self.profileView.menuListTableView.hidden = YES;
    
    self.profileView.titleLabel.text = @"Profile";

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

#pragma mark - TableView

#pragma mark - Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.profileView.mContentListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [self.profileView.mContentListArray objectAtIndex:indexPath.row];
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
        PickMyFriendViewController *pickMyFriendVC = [[PickMyFriendViewController alloc] init];
        
        // Summary view controller.
        UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:pickMyFriendVC];
        
        navigationVC.navigationBar.hidden = YES;
        appDelegate.window.rootViewController = navigationVC;
    }
    else if (indexPath.row == 2)
    {
        self.profileView.menuListTableView.hidden = YES;
    }
}
#pragma mark - Menu

- (void)menuList:(UIButton *) sender
{
    [self.profileView bringSubviewToFront:self.profileView.menuListTableView];
    if (self.profileView.menuListTableView.hidden)
    {
        self.profileView.menuListTableView.hidden = NO;
        [self.profileView.menuListTableView reloadData];
    }
    else
    {
        self.profileView.menuListTableView.hidden = YES;
    }
    
}

@end
