//
//  BaseView.m
//  Photomania
//
//  Created by Muthuraj M on 12/19/14.
//  Copyright (c) 2014 Market Simplified. All rights reserved.
//

#import "BaseView.h"
#import "MBProgressHUD.h"

@interface BaseView()

@property (nonatomic,strong) MBProgressHUD *loadingView;
@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation BaseView

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        [self createViews];
    }
    return self;
}

- (void)createViews
{
    self.frame = [[UIScreen mainScreen] bounds];
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Default.png"] bgColor:[UIColor clearColor]];
    [self addSubview:self.imageView];
    
    self.fullContentView = [[UIView alloc] initWithFrame:self.bounds];
    [self addSubview:self.fullContentView];
}

- (void)createLocationManger
{
    self.locationManager = [[CLLocationManager alloc] init];
    
    self.locationManager.delegate = self;
    if(IS_OS_8_OR_LATER){
        NSUInteger code = [CLLocationManager authorizationStatus];
        if (code == kCLAuthorizationStatusNotDetermined && ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)] || [self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])) {
            // choose one request according to your business.
            if([[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSLocationAlwaysUsageDescription"]){
                [self.locationManager requestAlwaysAuthorization];
            } else if([[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSLocationWhenInUseUsageDescription"]) {
                [self.locationManager  requestWhenInUseAuthorization];
            } else {
                NSLog(@"Info.plist does not contain NSLocationAlwaysUsageDescription or NSLocationWhenInUseUsageDescription");
            }
        }
    }
    [self.locationManager startUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (!currentLocation)
    {
        [self.locationManager stopUpdatingLocation];
        
        //longitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        //latitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
    }
}

#pragma SetupLoading View

- (void)setupLoadingView:(UIView *)view
{
    if (self.loadingView)
    {
        self.loadingView = nil;
    }
    
    self.loadingView = [MBProgressHUD showHUDAddedTo:view animated:YES];
    self.loadingView.mode = MBProgressHUDModeIndeterminate;
}

- (void)showLoadingMessage:(NSString *)message addedToView:(UIView *)view
{
    [self setupLoadingView:view];
    
    self.loadingView.labelText = message;
    [self.loadingView show:YES];
}

- (void)hideLoadingMessageForView:(UIView *)view
{
    [MBProgressHUD hideHUDForView:view animated:YES];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.fullContentView.frame = CGRectMake(0,0, self.frame.size.width, self.frame.size.height );
    
}
@end
