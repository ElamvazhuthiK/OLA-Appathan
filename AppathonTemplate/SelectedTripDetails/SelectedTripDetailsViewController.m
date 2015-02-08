//
//  SelectedTripDetailsViewController.m
//  AppathonTemplate
//
//  Created by abhilash on 07/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "SelectedTripDetailsViewController.h"
#import "SelectedTripDetailsView.h"
#import "AppDelegate.h"
#import "SummaryViewController.h"
#import "ProfileViewController.h"
#import "PickMyFriendViewController.h"

#define CAR_MODEL @"car_model"
#define DURATION @"duration"
#define CAR_COST @"car_cost"

#define CABS_INFO_JSON @"[{\"id\": 4385763, \"lat\": 13.204492, \"lng\": 77.707687, \"license_number\": \"KA 06 HJ 6666\", \"car_model\": \"Swift\", \"color\": \"Blue\", \"driver_name\": \"Mohan.K\", \"driver_mobile\": \"9412567863\", \"duration\": \"3 mins near by\", \"car_cost\": \"305\"},{\"id\": 4385764, \"lat\": 13.204492, \"lng\": 77.707687, \"license_number\": \"KA 06 HJ 6666\", \"car_model\": \"Verna\", \"color\": \"Yellow\", \"driver_name\": \"Kalyan.K\", \"driver_mobile\": \"9412567864\", \"duration\": \"7 mins near by\", \"car_cost\": \"325\"},{\"id\": 4385763, \"lat\": 13.204492, \"lng\": 77.707687, \"license_number\": \"KA 06 HJ 6666\", \"car_model\": \"Logan\", \"color\": \"Gray\", \"driver_name\": \"Krishna.P\", \"driver_mobile\": \"9412567865\", \"duration\": \"10 mins near by\", \"car_cost\": \"350\"},{\"id\": 4385763, \"lat\": 13.204492, \"lng\": 77.707687, \"license_number\": \"KA 06 HJ 6666\", \"car_model\": \"Innova\", \"color\": \"Blue\", \"driver_name\": \" Raj kumar.S\", \"driver_mobile\": \"9412567866\", \"duration\": \"15 mins near by\", \"car_cost\": \"370\"}, {\"id\": 4385763, \"lat\": 13.204492, \"lng\": 77.707687, \"license_number\": \"KA 06 HJ 6666\", \"car_model\": \"Scorpio\", \"color\": \"White\", \"driver_name\": \" Subhash.A\", \"driver_mobile\": \"9412567867\", \"duration\": \"15 mins near by\", \"car_cost\": \"340\"}]"
@interface SelectedTripDetailsViewController ()<UIGestureRecognizerDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *cabsInformationArray;
}
@property (nonatomic, strong) SelectedTripDetailsView *selTripDetailsView;

@end

@implementation SelectedTripDetailsViewController

#pragma mark - Memory warning methods

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View life cycle methods

- (void)createViews
{
    
    self.selTripDetailsView = [[SelectedTripDetailsView alloc] init];
    self.view = self.selTripDetailsView;
    self.navigationController.navigationBar.hidden = NO;
    self.selTripDetailsView.menuListTableView.hidden = YES;
    self.selTripDetailsView.menuListTableView.dataSource = self;
    self.selTripDetailsView.menuListTableView.delegate = self;
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSString *cJsonString = CABS_INFO_JSON;
    
    NSError *error ;
    
    cabsInformationArray = [[NSMutableArray alloc] initWithArray:[NSJSONSerialization JSONObjectWithData:[cJsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&error]];
    
    NSLog(@"Cabs information : %@", cabsInformationArray);
    
    [self.selTripDetailsView.placeInfoLabel setBackgroundColor:[UIColor signUpBackgroundColor]];
    [self.selTripDetailsView.placeInfoLabel setTextColor:[UIColor blackColor]];
    
    // User pick images.
    [self picksViewCreation];
    
    // Cabs available view.
    [self availableCabsCreation];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.selTripDetailsView.placeInfoLabel.text = @"Majestry to Iscan";
}
#pragma mark - Elements Creation


- (void)picksViewCreation
{
    for (NSInteger picPosition = 0; picPosition < 5; picPosition++)
    {
        NSInteger xPosition = 10 + (picPosition * 110);
        //NSLog(@"%d", xPosition);
        UIImageView *picksImageView = [[UIImageView alloc] initWithFrame:CGRectMake(xPosition, 10, 100, 100)];
        
        [picksImageView setImage:[UIImage imageNamed:@"gallery"]];
        if (picPosition == 0)
        {
            [picksImageView setImage:[UIImage imageNamed:@"csmera"]];
        }
        else
        {
            
        }
        
        // Pick image tag setting.
        [picksImageView setTag:(picPosition+1)];
        picksImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(picTapGestureRecognise:)];
        
        [tapGesture setDelegate:self];
        [picksImageView addGestureRecognizer:tapGesture];
        //[picksView setBackgroundColor:[UIColor magentaColor]];
        [self.selTripDetailsView.picksContainerScrollView addSubview:picksImageView];
    }
}

- (void)availableCabsCreation
{
    for (NSInteger picPosition = 0; picPosition < cabsInformationArray.count; picPosition++)
    {
        NSDictionary *cInformationDictionary = [cabsInformationArray objectAtIndex:picPosition];
        
        NSInteger xPosition = 10 + (picPosition * 210);
        
        //NSLog(@"%ld", xPosition);
        UIView *cabView = [[UIView alloc] initWithFrame:CGRectMake(xPosition, 10, 200, 61)];
        [cabView setBackgroundColor:[UIColor blackColor]];
        
        // Cab image view adding
        UIImageView *availableCabsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 16, 40, 41)];
        
        [availableCabsImageView setImage:[UIImage imageNamed:@"cab1"]];
        [cabView addSubview:availableCabsImageView];
        
        // Car name Label
        UILabel *cNameLabel = [[UILabel alloc] initWithText:[cInformationDictionary valueForKey:CAR_MODEL] textAlignment:NSTextAlignmentLeft textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:14]];
        [cNameLabel setFrame:CGRectMake(50, 16, 60, 25)];
        
        [cabView addSubview:cNameLabel];
        
        // Reach time  Label
        UILabel *rTimeLabel = [[UILabel alloc] initWithText:[cInformationDictionary valueForKey:DURATION] textAlignment:NSTextAlignmentLeft textColor:[UIColor lightGrayColor] font:[UIFont systemFontOfSize:8]];
        
        [rTimeLabel setFrame:CGRectMake(50, 40, 60, 21)];
        
        //rTimeLabel.text = @"8 min near by";
        [cabView addSubview:rTimeLabel];
        
        
        // Cab image view adding
        UIImageView *rupeeImage = [[UIImageView alloc] initWithFrame:CGRectMake(120, 16, 21, 30)];
        
        [rupeeImage setImage:[UIImage imageNamed:@"rupee"]];
        [cabView addSubview:rupeeImage];
        
        // Car name Label
        UILabel *amountLabel = [[UILabel alloc] initWithText:[cInformationDictionary valueForKey:CAR_COST] textAlignment:NSTextAlignmentLeft textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:14]];
        [amountLabel setFrame:CGRectMake(150, 16, 40, 30)];
        
        [cabView addSubview:amountLabel];
        
        // Pick image tag setting.
        [cabView setTag:(picPosition+1)];
        cabView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cabTapGestureRecognise:)];
        
        [tapGesture setDelegate:self];
        [cabView addGestureRecognizer:tapGesture];
        //[picksView setBackgroundColor:[UIColor magentaColor]];
        [self.selTripDetailsView.cabsInfoScrollView addSubview:cabView];
    }
}

#pragma mark - Gesture Recognize

- (void)picTapGestureRecognise:(UITapGestureRecognizer*) tapGesture
{
    UIImageView *selectedUserImage = (UIImageView*)tapGesture.view;
    
    //    NSInteger
    //NSLog(@"%@", [priorityUserDetailsArray objectAtIndex:selectedUserImage.tag]);
    
    //    NSMutableDictionary *selectedUserDetailsDictionary = [priorityUserDetailsArray objectAtIndex:selectedUserImage.tag];
    //
    //    // Opening Pdf file.
    //    NSString *pdfFilepathString = [[NSBundle mainBundle] pathForResource:[selectedUserDetailsDictionary valueForKey:PDF_FILE_NAME] ofType:@"pdf"];
    //
    //    NSFileManager *filemanager = [NSFileManager defaultManager];
    //
    //    if ([filemanager fileExistsAtPath:pdfFilepathString])
    //    {
    //        NSURL *pdfFileUrl = [NSURL fileURLWithPath:pdfFilepathString];
    //
    //        //NSURL *URL = [[NSBundle mainBundle] URLForResource:@"sample" withExtension:@"pdf"];
    //
    //        [self performSegueWithIdentifier:@"PdfViewer" sender:pdfFileUrl];
    //    }
    //    else
    //    {
    //        UIAlertView *noPdfAlertView = [[UIAlertView alloc] initWithTitle:@"Marketing" message:@"No pdf file" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    //        [noPdfAlertView show];
    //    }
}

- (void)cabTapGestureRecognise:(UITapGestureRecognizer*) tapGesture
{
    //UIImageView *selectedUserImage = (UIImageView*)tapGesture.view;
    
    UIAlertView *confirmationCabAlertView = [[UIAlertView alloc] initWithTitle:@"" message:@"Please confirm Cab." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Confirm", nil];
    
    [confirmationCabAlertView show];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark - TableView

#pragma mark - Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.selTripDetailsView.mContentListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [self.selTripDetailsView.mContentListArray objectAtIndex:indexPath.row];
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
        ProfileViewController *profileVC = [[ProfileViewController alloc] init];
        
        UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:profileVC];
        
        navigationVC.navigationBar.hidden = YES;
        appDelegate.window.rootViewController = navigationVC;
    }
}

#pragma mark - Menu

- (void)menuList:(UIButton *) sender
{
    if (self.selTripDetailsView.menuListTableView.hidden)
    {
        self.selTripDetailsView.menuListTableView.hidden = NO;
        [self.selTripDetailsView.menuListTableView reloadData];
    }
    else
    {
        self.selTripDetailsView.menuListTableView.hidden = YES;
    }
    
}

@end
