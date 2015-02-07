//
//  SignUpModel.h
//  AppathonTemplate
//
//  Created by inxs tech on 07/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "BaseModel.h"
#import "ModelBase.h"

@interface SignUpRequest:ModelBase
@property(nonatomic, strong) NSString *email;
@property(nonatomic, strong) NSString *password;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *mobile;
@property(nonatomic, strong) NSString *source;
@property(nonatomic, strong) NSString *device_id;
@end

@interface SignUpResponse:ModelBase
@property(nonatomic, strong) NSString *status;
@end
@protocol SignUpModelDelegate <BaseModelDelegate>
- (void)signUpSuccess;
@end
@interface SignUpModel : BaseModel
@property(nonatomic, weak)id<SignUpModelDelegate>delegate;
@end
