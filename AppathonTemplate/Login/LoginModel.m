//
//  LoginModel.m
//  AppathonTemplate
//
//  Created by inxs tech on 07/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel
- (void)sendRequest:(id<JSONModelBaseProtocol>)request
{
    [super sendRequest:request];
}
- (void)handleResponse:(NSDictionary*)response
{
    NSLog(@"handleResponse %@", [response description]);
}
@end
