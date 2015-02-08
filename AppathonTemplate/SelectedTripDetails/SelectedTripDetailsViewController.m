//
//  SelectedTripDetailsViewController.m
//  AppathonTemplate
//
//  Created by abhilash on 07/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "SelectedTripDetailsViewController.h"
#import "SelectedTripDetailsView.h"

#define CABS_INFO_JSON @"[{\"id\": 4385763, \"lat\": 13.204492, \"lng\": 77.707687, \"license_number\": \"KA 06 HJ 6666\", \"car_model\": \"Maruti Swift Dzire\", \"color\": \"Blue\", \"driver_name\": \"Mohan.K\", \"driver_mobile\": \"9412567863\", \"duration\": \"3 mins\"},{\"id\": 4385764, \"lat\": 13.204492, \"lng\": 77.707687, \"license_number\": \"KA 06 HJ 6666\", \"car_model\": \"Hundai Verna\", \"color\": \"Yellow\", \"driver_name\": \"Kalyan.K\", \"driver_mobile\": \"9412567864\", \"duration\": \"7 mins\"},{\"id\": 4385763, \"lat\": 13.204492, \"lng\": 77.707687, \"license_number\": \"KA 06 HJ 6666\", \"car_model\": \"Mahendra Logan\", \"color\": \"Gray\", \"driver_name\": \"Krishna.P\", \"driver_mobile\": \"9412567865\", \"duration\": \"10 mins\"},{\"id\": 4385763, \"lat\": 13.204492, \"lng\": 77.707687, \"license_number\": \"KA 06 HJ 6666\", \"car_model\": \"TATA Indigo\", \"color\": \"Blue\", \"driver_name\": \" Raj kumar.S\", \"driver_mobile\": \"9412567866\", \"duration\": \"15 mins\"}, {\"id\": 4385763, \"lat\": 13.204492, \"lng\": 77.707687, \"license_number\": \"KA 06 HJ 6666\", \"car_model\": \"Maruti Swift\", \"color\": \"White\", \"driver_name\": \" Subhash.A\", \"driver_mobile\": \"9412567867\", \"duration\": \"15 mins\"}]"
@interface SelectedTripDetailsViewController ()<UIGestureRecognizerDelegate>
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

- (void)loadView
{
    self.selTripDetailsView = [[SelectedTripDetailsView alloc] init];
    self.view = self.selTripDetailsView;
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSString *cJsonString = CABS_INFO_JSON;
    
    NSError *error ;
    
    cabsInformationArray = [[NSMutableArray alloc] initWithArray:[NSJSONSerialization JSONObjectWithData:[cJsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&error]];
    
    NSLog(@"Cabs information : %@", cabsInformationArray);
    
    // User pick images.
    [self picksViewCreation];
    
    // Cabs available view.
    [self availableCabsCreation];
    
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
        
        [picksImageView setImage:[UIImage imageNamed:@"Google"]];
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
        NSInteger xPosition = 10 + (picPosition * 110);
        //NSLog(@"%d", xPosition);
        UIImageView *availableCabsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(xPosition, 10, 100, 100)];
        
        [availableCabsImageView setImage:[UIImage imageNamed:@"Google"]];
        // Pick image tag setting.
        [availableCabsImageView setTag:(picPosition+1)];
        availableCabsImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cabTapGestureRecognise:)];
        
        [tapGesture setDelegate:self];
        [availableCabsImageView addGestureRecognizer:tapGesture];
        //[picksView setBackgroundColor:[UIColor magentaColor]];
        [self.selTripDetailsView.cabsInfoScrollView addSubview:availableCabsImageView];
    }
}

#pragma mark - Gesture Recognize

- (void)picTapGestureRecognise:(UITapGestureRecognizer*) tapGesture
{
    UIImageView *selectedUserImage = (UIImageView*)tapGesture.view;
    
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

@end
