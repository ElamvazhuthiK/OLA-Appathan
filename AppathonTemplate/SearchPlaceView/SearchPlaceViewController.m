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



@interface SearchPlaceViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *mContentListArray;
}
@property (nonatomic, strong) UITableView *menuListTableView;

@property (nonatomic,strong) SearchPlaceView *searchPlaceView;

@end


@implementation SearchPlaceViewController

<<<<<<< HEAD
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
=======
#pragma mark - View life cycle methods

- (void)loadView
>>>>>>> e875199e3a653cb50c54fff6f917efc50f3d8e0d
{
    
    self.searchPlaceView = [[SearchPlaceView alloc] init];
    [self.view addSubview:self.searchPlaceView];
    
    [self.searchPlaceView.resetBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
<<<<<<< HEAD
    [self.searchPlaceView.doneBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
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
=======
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
>>>>>>> e875199e3a653cb50c54fff6f917efc50f3d8e0d

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
