//
//  SearchPlaceViewController.m
//  AppathonTemplate
//
//  Created by Raghunathan on 2/8/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "SearchPlaceViewController.h"
#import "SearchPlaceView.h"
#import "SummaryViewController.h"
#import "AppDelegate.h"
#import "PickMyFriendViewController.h"
#import "ProfileViewController.h"


@interface SearchPlaceViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) SearchPlaceView *searchPlaceView;

@end


@implementation SearchPlaceViewController

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        //[self createViews];
    }
    
    return self;
    
}

- (void)createViews
{
    
    self.searchPlaceView = [[SearchPlaceView alloc] init];
    [self.view addSubview:self.searchPlaceView];
    
    [self.searchPlaceView.resetBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.searchPlaceView.doneBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.searchPlaceView.menuBtn addTarget:self action:@selector(menuList:) forControlEvents:UIControlEventTouchUpInside];
    self.searchPlaceView.menuListTableView.hidden = YES;
    self.searchPlaceView.menuListTableView.dataSource = self;
    self.searchPlaceView.menuListTableView.delegate = self;
}

- (void)btnClick:(UIButton *)sender
{
    if (sender == self.searchPlaceView.resetBtn)
    {
        self.searchPlaceView.widget2.bodyLabel.text = @"Domlur";
        [self.searchPlaceView.tableView reloadData];
    }
    else
    {
        SummaryViewController *vc = [[SummaryViewController alloc] init];
        [self navigateToViewController:vc];
    }
}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.searchPlaceView.frame = self.view.bounds;
}

#pragma mark - Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.searchPlaceView.mContentListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [self.searchPlaceView.mContentListArray objectAtIndex:indexPath.row];
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
        
        // Pick my firend view controller.
        UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:pickMyFriendVC];
        
        navigationVC.navigationBar.hidden = YES;
        
        appDelegate.window.rootViewController = navigationVC;
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
- (void)menuList:(UIButton *) sender
{
    [self.searchPlaceView bringSubviewToFront:self.searchPlaceView.menuListTableView];
    
    if (self.searchPlaceView.menuListTableView.hidden)
    {
        self.searchPlaceView.menuListTableView.hidden = NO;
        [self.searchPlaceView.menuListTableView reloadData];
    }
    else
    {
        self.searchPlaceView.menuListTableView.hidden = YES;
    }
}
@end
