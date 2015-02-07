//
//  GoogleMapView.m
//  AppathonTemplate
//
//  Created by Raghunathan on 2/7/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "GoogleMapView.h"

@implementation GoogleMapView

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
    [self drawRouteBetweenPoints];
}

- (void)drawRouteBetweenPoints
{
    GMSCameraPosition *cameraPosition=[GMSCameraPosition cameraWithLatitude:18.5203 longitude:73.8567 zoom:12];
    self.googleMapView =[GMSMapView mapWithFrame:CGRectZero camera:cameraPosition];
    self.googleMapView.myLocationEnabled=YES;
    GMSMarker *marker=[[GMSMarker alloc]init];
    marker.position=CLLocationCoordinate2DMake(18.5203, 73.8567);
    marker.icon=[UIImage imageNamed:@"aaa.png"] ;
    marker.groundAnchor=CGPointMake(0.5,0.5);
    marker.map= self.googleMapView;
    GMSMutablePath *path = [GMSMutablePath path];
    [path addCoordinate:CLLocationCoordinate2DMake(@(18.520).doubleValue,@(73.856).doubleValue)];
    [path addCoordinate:CLLocationCoordinate2DMake(@(16.7).doubleValue,@(73.8567).doubleValue)];

    GMSPolyline *rectangle = [GMSPolyline polylineWithPath:path];
    rectangle.strokeWidth = 2.f;
    rectangle.map = self.googleMapView;
    [self  addSubview:self.googleMapView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.googleMapView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

@end
