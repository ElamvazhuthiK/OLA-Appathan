//
//  PickMyFriendView.m
//  AppathonTemplate
//
//  Created by inxs tech on 08/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "PickMyFriendView.h"

@interface PickMyFriendView()<UITextFieldDelegate>
@property(nonatomic, strong)UIView *bgView;
@end
@implementation PickMyFriendView
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (void)createViews
{
    [super createViews];
    
//    CGRect frame = self.frame;
//    frame.origin.y = 20;
//    self.frame = frame;
    
    self.titleLabel.text = @"Pick My Friend";
    self.bgView = [[UIView alloc] init];
    self.bgView.userInteractionEnabled = YES;
    self.bgView.backgroundColor = UIColorFromRGB(0xcccccc);
    self.bgView.opaque = 0.9;
    self.bgView.alpha = 0.9;
    
    [self addSubview:self.bgView];
    
    self.imgViewFriend = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nophoto.png"]];
    self.imgViewFriend.backgroundColor = [UIColor grayColor];
    [self.bgView addSubview:self.imgViewFriend];
    
    self.txtFieldName = [[UITextField alloc] initWithPlaceholder:@"Name" andBackgroundColor:[UIColor clearColor] andTextColor:[UIColor blueColor] andTextAlignment:NSTextAlignmentCenter andBorderStyle:UITextBorderStyleLine];
    self.txtFieldName.autocorrectionType = UITextAutocorrectionTypeNo;
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
    
    self.locationPicker.hidden = YES;
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
    CGRect frame;// = self.frame;
//    frame.origin.y = 40;
//    self.frame = frame;
    self.bgView.frame = CGRectInset(self.bounds, 10, 60);
    frame = self.bgView.frame;
    frame.size.height -= 10;
    self.bgView.frame = frame;
    
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
    
    self.locationPicker.frame = CGRectMake(0, frame.size.height - 120, frame.size.width, 120);
    self.datePicker.frame = CGRectMake(0, frame.size.height - 120, frame.size.width, 120);
    self.timePicker.frame = CGRectMake(0, frame.size.height - 120, frame.size.width, 120);
    
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
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint point = [[touches anyObject] locationInView:self.imgViewFriend];
    if (CGRectContainsPoint(self.imgViewFriend.bounds, point)) {
        if ([self.pickDelegate respondsToSelector:@selector(pickMyFriendSelectPhoto)]) {
            [self.pickDelegate pickMyFriendSelectPhoto];
        }
    }else {
        NSUInteger touchCount = [touches count];
        if (touchCount == 1) {
            [self.txtFieldName resignFirstResponder];
            [self.txtFieldNumber resignFirstResponder];
        }
    }
}
@end
