//
//  SearchPlaceViewController.m
//  AppathonTemplate
//
//  Created by Raghunathan on 2/8/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "SearchPlaceViewController.h"
#import "SearchPlaceView.h"


@interface SearchPlaceViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *mContentListArray;
}
@property (nonatomic, strong) UITableView *menuListTableView;

@property (nonatomic,strong) SearchPlaceView *searchPlaceView;

@end


@implementation SearchPlaceViewController

#pragma mark - View life cycle methods

- (void)loadView
{
    self.searchPlaceView = [[SearchPlaceView alloc] init];
    self.view = self.searchPlaceView;
    
    NSLog(@"%@", self.searchPlaceView.menuBtn);
    [self.searchPlaceView.menuBtn addTarget:self action:@selector(menuList:) forControlEvents:UIControlEventTouchUpInside];
    
    self.searchPlaceView.menuListTableView.dataSource = self;
    self.searchPlaceView.menuListTableView.delegate = self;
    self.menuListTableView.hidden = YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

#pragma mark - TableView

#pragma mark - Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return mContentListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [mContentListArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - Delagate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
#pragma mark - Menu
- (void)menuList:(UIButton *) sender
{
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
