//
//  Validator.h
//  ABM
//
//  Created by Sharma Elanthiraiyan on 12/20/13.
//  Copyright (c) 2013 Saranya Sivanandham. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Error.h"

@interface Validator : NSObject

+ (BOOL)isValidResponse:(NSDictionary*)response;
+ (Error*)getError:(NSDictionary*)response;
+ (NSString*)getSVCName:(NSDictionary*)response;
+ (Error *)getErrorForNoResponse;
@end
