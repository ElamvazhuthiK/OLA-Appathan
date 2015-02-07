//
//  BaseView.h
//  Photomania
//
//  Created by Muthuraj M on 12/19/14.
//  Copyright (c) 2014 Market Simplified. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@protocol BaseViewDelegate<NSObject>
- (void)removeView;
@end

@interface BaseView : UIView<CLLocationManagerDelegate>

@property(nonatomic,weak) id<BaseViewDelegate>delegate;
@property (nonatomic,strong) CLLocationManager *locationManager;

- (void)createViews;

- (void)showLoadingMessage:(NSString *)message addedToView:(UIView *)view;
- (void)hideLoadingMessageForView:(UIView *)view;

@end
