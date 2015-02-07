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

@implementation SignUpRequest
+ (NSString*)getName
{
    return @"signup";
}
+ (NSString*)getGroup
{
    return @"user";
}
+ (NSString*)getVersion
{
    return @"v1";
}
@end

@interface SignUpResponse:ModelBase
@property(nonatomic, strong) NSString *status;
@end
@implementation SignUpResponse
+ (NSString*)getName
{
    return @"signup";
}
+ (NSString*)getGroup
{
    return @"user";
}
+ (NSString*)getVersion
{
    return @"v1";
}
@end
@interface SignUpModel : BaseModel

@end
