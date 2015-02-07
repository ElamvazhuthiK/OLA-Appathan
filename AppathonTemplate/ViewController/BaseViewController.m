//
//  BaseViewController.m
//  Photomania
//
//  Created by Muthuraj M on 12/19/14.
//  Copyright (c) 2014 Market Simplified. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

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
    
}

- (void)navigateToViewController:(UIViewController *)viewController
{
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
//    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86
//                                                            longitude:151.20
//                                                                 zoom:6];
//    self.googleMapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
//    self.googleMapView.myLocationEnabled = YES;
//    self.view = self.googleMapView;
//    
//    // Creates a marker in the center of the map.
//    GMSMarker *marker = [[GMSMarker alloc] init];
//    marker.position = CLLocationCoordinate2DMake(-33.86, 151.20);
//    marker.title = @"Sydney";
//    marker.snippet = @"Australia";
//    marker.map = self.googleMapView;
}

//- (void)drawRouteBetweenPoints
//{
//    GMSCameraPosition *cameraPosition=[GMSCameraPosition cameraWithLatitude:18.5203 longitude:73.8567 zoom:12];
//    _mapView =[GMSMapView mapWithFrame:CGRectZero camera:cameraPosition];
//    _mapView.myLocationEnabled=YES;
//    GMSMarker *marker=[[GMSMarker alloc]init];
//    marker.position=CLLocationCoordinate2DMake(18.5203, 73.8567);
//    marker.icon=[UIImage imageNamed:@"aaa.png"] ;
//    marker.groundAnchor=CGPointMake(0.5,0.5);
//    marker.map=_mapView;
//    GMSMutablePath *path = [GMSMutablePath path];
//    [path addCoordinate:CLLocationCoordinate2DMake(@(18.520).doubleValue,@(73.856).doubleValue)];
//    [path addCoordinate:CLLocationCoordinate2DMake(@(16.7).doubleValue,@(73.8567).doubleValue)];
//    
//    GMSPolyline *rectangle = [GMSPolyline polylineWithPath:path];
//    rectangle.strokeWidth = 2.f;
//    rectangle.map = _mapView;
//    self.view=_mapView;
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
