//
//  BaseView.h
//  Photomania
//
//  Created by Muthuraj M on 12/19/14.
//  Copyright (c) 2014 Market Simplified. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@protocol BaseViewDelegate<NSObject>

@end

@interface BaseView : UIView<CLLocationManagerDelegate>

@property(nonatomic,weak) id<BaseViewDelegate>delegate;
@property (nonatomic,strong) CLLocationManager *locationManager;


@property (nonatomic,strong) UIView *fullContentView;

- (void)createViews;

- (void)showLoadingMessage:(NSString *)message addedToView:(UIView *)view;
- (void)hideLoadingMessageForView:(UIView *)view;

@end
