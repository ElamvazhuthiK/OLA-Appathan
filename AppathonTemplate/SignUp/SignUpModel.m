//
//  SignUpModel.m
//  AppathonTemplate
//
//  Created by inxs tech on 07/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "SignUpModel.h"
@interface SignUpModel ()
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
@implementation SignUpModel
- (void)sendRequest:(id<JSONModelBaseProtocol>)request
{
    SignUpRequest *signUpRequest = request;
    signUpRequest.source = @"ios-app";
    signUpRequest.device_id = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    [super sendRequest:request];
}
- (void)handleResponse:(NSDictionary *)response
{
    NSError *jsonError = nil;
    NSData *data = [@"{\"status\": \"SUCCESS\"}" dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
    SignUpResponse *signUpResponse = [[SignUpResponse alloc] initWithDict:json];
    NSLog(@"handle Response %@", signUpResponse.status);
    if ([self.delegate respondsToSelector:@selector(signUpSuccess)]) {
        [self.delegate signUpSuccess];
    }
}
- (void)handleError:(Error *)errorObj
{
    
}
@end
