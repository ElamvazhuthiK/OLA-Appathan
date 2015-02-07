//
//  AppConfig.m
//  OPX
//
//  Created by Sharma Elanthiraiyan on 03/06/14.
//  Copyright (c) 2014 Market Simplified. All rights reserved.
//

#import "AppConfig.h"
#define STRINGIZE(x) #x
#define STRINGIZE2(x) STRINGIZE(x)
@implementation AppConfig
+ (NSString*)getURL
{
    return @"http://mobile-dev-service.optionsxpress.com";
}
@end
