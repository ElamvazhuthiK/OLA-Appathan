//
//  SummaryViewController.m
//  AppathonTemplate
//
//  Created by Raghunathan on 2/7/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "SummaryViewController.h"
#import "SummaryView.h"
#import "AppDelegate.h"
#import "PickMyFriendViewController.h"
#import "ProfileViewController.h"

@interface SummaryViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) SummaryView *summaryView;

@end

@implementation SummaryViewController

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
    NSLog(@"view %@",self.view);
    
    self.summaryView = [[SummaryView alloc] init];
    [self.view addSubview:self.summaryView];
    [self.summaryView.menuBtn addTarget:self action:@selector(menuList:) forControlEvents:UIControlEventTouchUpInside];
    self.summaryView.menuListTableView.dataSource = self;
    self.summaryView.menuListTableView.delegate = self;
    self.summaryView.menuListTableView.hidden = YES;
    
    self.summaryView.titleLabel.text = @"Cab for the day";
    [self.summaryView.topBar setFrame:CGRectMake(0, 0, self.summaryView.fullContentView.frame.size.width, 50)];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.summaryView.frame = self.view.bounds;
}

#pragma mark - TableView

#pragma mark - Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.summaryView.mContentListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [self.summaryView.mContentListArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - Delagate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    if (indexPath.row == 0)
    {
        self.summaryView.menuListTableView.hidden = YES;
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
    if (self.summaryView.menuListTableView.hidden)
    {
        self.summaryView.menuListTableView.hidden = NO;
        [self.summaryView.menuListTableView reloadData];
    }
    else
    {
       self.summaryView.menuListTableView.hidden = YES;
    }
    
}

@end
