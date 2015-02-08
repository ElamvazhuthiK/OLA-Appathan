//
//  PickMyFriendView.h
//  AppathonTemplate
//
//  Created by inxs tech on 08/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "BaseHeaderView.h"

@interface PickMyFriendView : BaseHeaderView
@property(nonatomic, strong)UIImageView *imgViewFriend;
@property(nonatomic, strong)UITextField *txtFieldName;
@property(nonatomic, strong)UITextField *txtFieldNumber;
@property(nonatomic, strong)UILabel *lblLocation;
@property(nonatomic, strong)UIButton *btnLocation;
@property(nonatomic, strong)UILabel *lblDate;
@property(nonatomic, strong)UIButton *btnDate;
@property(nonatomic, strong)UILabel *lblTime;
@property(nonatomic, strong)UIButton *btnTime;
@property(nonatomic, strong)UIPickerView *locationPicker;
@property(nonatomic, strong)UIDatePicker *datePicker;
@property(nonatomic, strong)UIDatePicker *timePicker;
@property(nonatomic, strong)UIButton *btnDone;
@end
