//
//  Validator.m
//  ABM
//
//  Created by Sharma Elanthiraiyan on 12/20/13.
//  Copyright (c) 2013 Saranya Sivanandham. All rights reserved.
//

#import "Validator.h"
//#import "AppMacros.h"

@interface Validator ()
@end

@implementation Validator

#pragma Property to valid Response
+ (BOOL)isValidResponse:(NSDictionary*)response
{
    if([[response valueForKeyPath:@"response.infoID"] isEqualToString:@"0"])
        return YES;
    return NO;
}

+ (Error *)getError:(NSDictionary*)response
{
      Error *error = [[Error alloc] init];
//    error.response=response;
//    error.message = info.defaultMessage;
//    error.infoID = infoID;
//    error.svcName = [[response objectForKey:@"response"] objectForKey:@"svcName"];
//    error.actionType = (ErrorActionType)[info.action intValue];
//    error.errorType = kErrorTypeServerError;
//   
//    if ([infoMsg length] > 0)
//    {
//        error.message = infoMsg;
//    }
    return error;
}

+ (Error *)getErrorForNoResponse
{
//    configDeviceModelResponseInfo *info = [ConfigModel getInfo:@"OX0011"];
//    
    Error *error = [[Error alloc] init];
//    error.response = nil;
//    error.message = [NSString stringWithFormat:@"%@ System is not able to process the current request.\n Please try again.",info.defaultMessage];
//    error.infoID = @"0X0011";
//    error.svcName = nil;
//    error.actionType = kErrorActionTypeOK;
//    error.errorType = kErrorTypeServerError;
    
    return error;
    
}

+ (NSString *)getSVCName:(NSDictionary *)response
{
    return [[response objectForKey:@"response"] objectForKey:@"svcName"];
}
@end
