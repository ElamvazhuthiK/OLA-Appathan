//
//  SearchPlaceView.m
//  AppathonTemplate
//
//  Created by Raghunathan on 2/8/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "SearchPlaceView.h"
#import "ImageDetails.h"

@interface SearchPlaceView ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property (nonatomic,strong) UIImageView *bgImage;

@property (nonatomic,strong) UITextField *searchText;


@property (nonatomic,assign) int count;
@property (nonatomic,assign) BOOL isWidget2;

@end

@implementation SearchPlaceView

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        
    }
    
    return self;
}

- (void)createViews
{
    [super createViews];
    
    self.count = 0;
    
    self.dataArray = [NSArray arrayWithObjects:@"Test",@"Test",@"Test",@"Test",@"Test",@"Test",@"Test", nil];
    
    self.bgImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image"] bgColor:[UIColor clearColor]];
    [self.mainContentView addSubview:self.bgImage];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    
    self.widget1 = [[WidgetView alloc] init];
    self.widget1.titleLabel.text = @"Start Place";
    self.widget1.bodyLabel.text = @"Domlur";
    [self.mainContentView addSubview:self.widget1];
    [self.widget1 addGestureRecognizer:tap];
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    
    self.widget2 = [[WidgetView alloc] init];
    self.widget2.titleLabel.text = @"Places I have to Visit";
    self.widget2.bodyLabel.text = @"Domlur";
    self.widget2.leftSepLine.hidden = NO;
    self.widget2.rightSepLine.hidden = NO;
    [self.widget2 addGestureRecognizer:tap2];
    
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    
    self.widget2.bottomHighLightLabel.hidden= NO;
    [self.mainContentView addSubview:self.widget2];
    
    self.widget3 = [[WidgetView alloc] init];
    self.widget3.titleLabel.text = @"Time I have";
    self.widget3.bodyLabel.text = @"10 Hrs";
    [self.widget3 addGestureRecognizer:tap3];
    [self.mainContentView addSubview:self.widget3];
    
    self.isWidget2 = YES;
    
    self.searchText = [[UITextField alloc] initWithPlaceholder:@"Search" andBackgroundColor:[UIColor clearColor] andTextColor:[UIColor whiteColor] andTextAlignment:NSTextAlignmentCenter andBorderStyle:UITextBorderStyleNone];
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:@"Search" attributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor] }];
    self.searchText.delegate = self;
    [self.searchText setAttributedPlaceholder:attrStr];
    [self.mainContentView addSubview:self.searchText];
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.mainContentView addSubview:self.tableView];
    
    self.resetBtn = [[UIButton alloc] initWithTitle:@"Reset" andBackgroundImage:@"image" andTextColor:[UIColor whiteColor]];
    self.resetBtn.backgroundColor = [UIColor blackColor];
    
    [self.mainContentView addSubview:self.resetBtn];
    
    self.doneBtn = [[UIButton alloc] initWithTitle:@"Done" andBackgroundImage:@"image" andTextColor:UIColorFromRGB(0xD7DE52)];
    self.doneBtn.backgroundColor = [UIColor blackColor];
    

    [self.mainContentView addSubview:self.doneBtn];
    
}

- (void)tapped:(UITapGestureRecognizer *)sender
{
    NSLog( @"sender %@",sender.view);
    if (sender.view == self.widget2)
    {
        self.isWidget2 = YES;
        self.widget1.bottomHighLightLabel.hidden = YES;
        self.widget3.bottomHighLightLabel.hidden = YES;
        self.widget2.bottomHighLightLabel.hidden = NO;
    }
    else
    {
        self.isWidget2 = NO;
        if (sender.view == self.widget1)
        {
            self.widget1.bottomHighLightLabel.hidden = NO;
            self.widget3.bottomHighLightLabel.hidden = YES;
            self.widget2.bottomHighLightLabel.hidden = YES;
        }
        else
        {
            self.widget1.bottomHighLightLabel.hidden = YES;
            self.widget3.bottomHighLightLabel.hidden = NO;
            self.widget2.bottomHighLightLabel.hidden = YES;
        }
    }
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma ##

#pragma tableView Delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray ? self.dataArray.count:0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellidentifier = @"cell";
    
    ImageDetails *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (!cell)
    {
        cell = [[ImageDetails alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
        cell.backgroundColor = UIColorFromRGB(0xC7C2BF);
        cell.alpha = 0;
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.isWidget2)
    {
        ImageDetails *cell = (ImageDetails *)[tableView cellForRowAtIndexPath:indexPath];
        
        if (cell.accessoryType == UITableViewCellAccessoryCheckmark)
        {
            cell.accessoryType = UITableViewCellAccessoryNone;
            
            if (self.count !=0)
            {
                self.count --;
            }
            
        }
        else{
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            self.count ++;
            
        }
        
        self.widget2.bodyLabel.text = [NSString stringWithFormat:@"Domlur + %d",self.count];
    }
    
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
    
    self.widget1.frame = CGRectMake(startXPos - 5, startYPos, fullWidth/3 + 5, 75);
    self.widget2.frame = CGRectMake(fullWidth/3, startYPos, fullWidth/3, 75);
    self.widget3.frame = CGRectMake(fullWidth*2/3, startYPos, fullWidth/3 + 5, 75);
    
    self.searchText.frame = CGRectMake(startXPos, self.widget1.frame.origin.y + self.widget1.frame.size.height, fullWidth, 25);
    
    self.tableView.frame = CGRectMake(startXPos + 5, self.searchText.frame.origin.y + self.searchText.frame.size.height, fullWidth - 10, fullHeight - (self.searchText.frame.origin.y + self.searchText.frame.size.height + 50));
    
    self.resetBtn.frame = CGRectMake(startXPos, self.tableView.frame.origin.y + self.tableView.frame.size.height, fullWidth/2, 50);
    self.doneBtn.frame = CGRectMake(self.resetBtn.frame.origin.x + self.resetBtn.frame.size.width , self.tableView.frame.origin.y + self.tableView.frame.size.height, fullWidth/2, 50);
}

@end
