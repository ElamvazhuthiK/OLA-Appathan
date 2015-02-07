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

#ifdef DEV
//    DDLogInfo(@"DEV, Connecting to http://mobile-dev-service.optionsxpress.com");
    return @"http://mobile-dev-service.optionsxpress.com";
    
#else
#ifdef UAT
//    DDLogInfo(@"UAT, Connecting to http://mobile-ua-service.optionsxpress.com");
    return @"http://mobile-ua-service.optionsxpress.com";
    
#else
//    DDLogInfo(@"PROD, Connecting to https://mobile-service.optionsxpress.com");
    return @"https://mobile-prod-service.optionsxpress.com";
#endif
#endif
}

+ (NSString*)getStreamerURL
{
#ifdef DEV
//    DDLogInfo(@"DEV, Streamer Connecting to mobile-dev-service.optionsxpress.com");
//    return @"mobile-dev-service.optionsxpress.com";
    
    return @"mobile-prod-streamer.optionsxpress.com";
    
#else
#ifdef UAT
//    DDLogInfo(@"UAT, Streamer Connecting to mobile-ua-streamer.optionsxpress.com");
    return @"mobile-ua-streamer.optionsxpress.com";
    
#else
//    DDLogInfo(@"PROD, Streamer Connecting to mobile-streamer.optionsxpress.com");
    return @"mobile-prod-streamer.optionsxpress.com";
#endif
#endif
}

+(NSString*)getDisclaimerURL
{
#ifdef DEV
    return @"https://mobile-config.optionsxpress.com/content/iphone/eula.html";
//    return @"http://mobile-dev-config.optionsxpress.com/content/iphone/eula.html";
    
#else
#ifdef UAT
    return @"http://mobile-config.optionsxpress.com/content/iphone/eula.html";
    
#else
    return @"https://mobile-config.optionsxpress.com/content/iphone/eula.html";
#endif
#endif
}
@end
