//
//  SummaryView.m
//  AppathonTemplate
//
//  Created by Raghunathan on 2/7/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "SummaryView.h"
#import "SummaryViewCell.h"
#import "WidgetView.h"

@interface SummaryView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) WidgetView *widget1,*widget2,*widget3;
@property (nonatomic,strong) UIImageView *bgImage;
@end

@implementation SummaryView

- (instancetype)init
{
    if ((self = ([super init])))
    {
        
    }
    return self;
    
}

- (void)createViews
{
    [super createViews];
    
    self.dataArray = [NSArray arrayWithObjects:@"Test",@"Test",@"Test",@"Test",@"Test",@"Test",@"Test", nil];
    
    self.bgImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image"] bgColor:[UIColor clearColor]];
    [self.mainContentView addSubview:self.bgImage];
    
    self.widget1 = [[WidgetView alloc] init];
    self.widget1.backgroundColor = UIColorFromRGB(0x3D3936);
    [self.mainContentView addSubview:self.widget1];
    
    self.widget2 = [[WidgetView alloc] init];
    self.widget2.backgroundColor = UIColorFromRGB(0x3D3936);
    [self.mainContentView addSubview:self.widget2];
    
    self.widget3 = [[WidgetView alloc] init];
    self.widget3.backgroundColor = UIColorFromRGB(0x3D3936);
    [self.mainContentView addSubview:self.widget3];
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.mainContentView addSubview:self.tableView];
    
}

#pragma ##

#pragma tableView Delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray ? self.dataArray.count:0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellidentifier = @"cell";
    
    SummaryViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (!cell)
    {
        cell = [[SummaryViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
        cell.backgroundColor = UIColorFromRGB(0xC7C2BF);
        cell.alpha = 0.8;
    }
    
    return cell;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    float startXPos = 0;
    float startYPos = 0;
    float fullWidth = self.mainContentView.frame.size.width - (startXPos*2);
    float fullHeight = self.mainContentView.frame.size.height- (startYPos*2);
    ;
    self.bgImage.frame = CGRectMake(startXPos, startYPos, fullWidth, fullHeight);
    
    self.widget1.frame = CGRectMake(startXPos, startYPos, fullWidth/3, 75);
    self.widget2.frame = CGRectMake(fullWidth/3, startYPos, fullWidth/3, 75);
    self.widget3.frame = CGRectMake(fullWidth*2/3, startYPos, fullWidth/3, 75);
    
    self.tableView.frame = CGRectMake(startXPos + 5, self.widget1.frame.origin.y + self.widget1.frame.size.height, fullWidth - 10, fullHeight - (self.widget1.frame.origin.y + self.widget1.frame.size.height));
    

}

@end
