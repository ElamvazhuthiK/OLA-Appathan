//
//  Error.h
//  OPX
//
//  Created by Chandrachudh on 6/20/14.
//  Copyright (c) 2014 Market Simplified. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    kErrorTypeNetworkError, //Will check err in response node
    kErrorTypeServerError, //Will check infoID infoMessage in response
    kErrorTypeInvalidSessionError
}ErrorType;

/*
 50	Information Dialog (Display a message with OK and upon action stay in the same screen).
 51	Confirmation Dialog (Display the message as  with Yes or No.)
 52	Session Timed out. Clear all session related data and take the user back to Login Screen and display the message
 53	Show maintenance page with a message
 54 Display the message in screen
 57	Display a message with OK and CANCEL button upon cancelling do nothing
 */
typedef enum {
    kErrorActionTypeNone = 0,
    kErrorActionTypeOK = 50,
    kErrorActionTypeMessageWithYESorNO = 51,
    kErrorActionTypeSessionTimeOut = 52,
    kErrorActionTypeShowMaintenance = 53,
    kErrorActionTypeMessageInScreen = 54,
    kErrorActionTypeMessageWithOKandCANCEL = 57,
}ErrorActionType;

@interface Error : NSObject

@property (nonatomic, assign) ErrorType errorType;
@property (nonatomic, assign) ErrorActionType actionType;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *infoID;
@property (nonatomic, strong) NSString *svcName;
@property (nonatomic, strong) NSDictionary *response;
@end
