//
//  PickMyFriendView.m
//  AppathonTemplate
//
//  Created by inxs tech on 08/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "PickMyFriendView.h"

@interface PickMyFriendView()<UITextFieldDelegate>
@property(nonatomic, strong)UIImageView *bgView;
@end
@implementation PickMyFriendView
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}
- (void)createViews
{
    [super createViews];
    
    self.bgView = [[UIImageView alloc] init];
    self.bgView.userInteractionEnabled = YES;
    self.bgView.backgroundColor = [UIColor yellowColor];
    
    [self addSubview:self.bgView];
    
    self.imgViewFriend = [[UIImageView alloc] init];
    self.imgViewFriend.backgroundColor = [UIColor grayColor];
    [self.bgView addSubview:self.imgViewFriend];
    
    self.txtFieldName = [[UITextField alloc] initWithPlaceholder:@"Name" andBackgroundColor:[UIColor clearColor] andTextColor:[UIColor blueColor] andTextAlignment:NSTextAlignmentCenter andBorderStyle:UITextBorderStyleLine];
    [self.bgView addSubview:self.txtFieldName];
    
    
    self.txtFieldNumber = [[UITextField alloc] initWithPlaceholder:@"Phone Number" andBackgroundColor:[UIColor clearColor] andTextColor:[UIColor blueColor] andTextAlignment:NSTextAlignmentCenter andBorderStyle:UITextBorderStyleLine];
    self.txtFieldNumber.keyboardType = UIKeyboardTypePhonePad;
    [self.bgView addSubview:self.txtFieldNumber];
    
    self.lblLocation = [[UILabel alloc] init];
    self.lblLocation.text = @"Location";
    [self.bgView addSubview:self.lblLocation];
    
    self.lblDate = [[UILabel alloc] init];
    self.lblDate.text = @"Date";
    [self.bgView addSubview:self.lblDate];
    
    self.lblTime = [[UILabel alloc] init];
    self.lblTime.text = @"Time";
    [self.bgView addSubview:self.lblTime];
    
    self.btnLocation = [[UIButton alloc] initWithTitle:@">>" andBackgroundImage:nil andTextColor:UIColorFromRGB(0x0000ff)];
    [self.bgView addSubview:self.btnLocation];
    
    self.btnDate = [[UIButton alloc] initWithTitle:@">>" andBackgroundImage:nil andTextColor:UIColorFromRGB(0x0000ff)];
    [self.bgView addSubview:self.btnDate];
    
    self.btnTime = [[UIButton alloc] initWithTitle:@">>" andBackgroundImage:nil andTextColor:UIColorFromRGB(0x0000ff)];
    [self.bgView addSubview:self.btnTime];
    
    self.locationPicker = [[UIPickerView alloc] init];
    [self.bgView addSubview:self.locationPicker];
    
    self.datePicker = [[UIDatePicker alloc] init];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    [self.bgView addSubview:self.datePicker];

    self.timePicker = [[UIDatePicker alloc] init];
    self.timePicker.datePickerMode = UIDatePickerModeTime;
    [self.bgView addSubview:self.timePicker];
    
    
    self.btnDone = [[UIButton alloc] initWithTitle:@"Done" andBackgroundImage:nil andTextColor:UIColorFromRGB(0xD7DE52)];
    [self addSubview:self.btnDone];
    
    
    self.datePicker.hidden = YES;
    self.timePicker.hidden = YES;
    
    self.txtFieldName.delegate = self;
    self.txtFieldNumber.delegate = self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    float y = 10;
    float height = 40;
    self.bgView.frame = CGRectInset(self.frame, 10,50);
    CGRect frame = self.bgView.frame;
    self.imgViewFriend.frame = CGRectMake((frame.size.width - 100)/2, y, 100, 100);
    y+=110;
    self.txtFieldName.frame = CGRectMake(10, y, (frame.size.width - 20), height);
    y+=(height+5);
    self.txtFieldNumber.frame = CGRectMake(10, y, (frame.size.width - 20), height);
    y+=(height+5);
    self.lblLocation.frame = CGRectMake(10, y, (frame.size.width - 60), height);
    self.btnLocation.frame = CGRectMake(10+(frame.size.width - 60), y, 40, height);
    y+=(height+5);
    self.lblDate.frame = CGRectMake(10, y, (frame.size.width - 20), height);
    self.btnDate.frame = CGRectMake(10+(frame.size.width - 60), y, 40, height);
    y+=(height+5);
    self.lblTime.frame = CGRectMake(10, y, (frame.size.width - 20), height);
    self.btnTime.frame = CGRectMake(10+(frame.size.width - 60), y, 40, height);
    y+=(height+5);
    
    self.locationPicker.frame = CGRectMake(0, frame.size.height - 140, frame.size.width, 140);
    self.datePicker.frame = CGRectMake(0, frame.size.height - 140, frame.size.width, 140);
    self.timePicker.frame = CGRectMake(0, frame.size.height - 140, frame.size.width, 140);
    
    self.btnDone.frame = CGRectMake((self.frame.size.width - 100)/2, frame.origin.y + frame.size.height + 5, 100, 30);
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
}
@end
