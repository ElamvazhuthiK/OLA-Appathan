//
//  BaseModel.m
//  OPX
//
//  Created by Sharma Elanthiraiyan on 03/06/14.
//  Copyright (c) 2014 Market Simplified. All rights reserved.
//

#import "BaseModel.h"
#import "AppConfig.h"
#import "Error.h"
#import "Validator.h"
#import "ModelBase.h"

@interface BaseModel ()
@end

@implementation BaseModel

- (void)sendRequest:(id<JSONModelBaseProtocol>)request
{
    id classRequest = [request class];
    NSString *urlToConnect = [NSString stringWithFormat:@"%@/%@/%@/%@", [AppConfig getURL], [classRequest getVersion],[classRequest getGroup], [classRequest getName]];
    
    NSMutableURLRequest *therequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlToConnect]];
    [therequest setHTTPMethod:@"POST"];
    [therequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    [therequest setHTTPBody:[[((ModelBase *)request) decoratedJSONRequest] dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSLog(@"\n\n request is %@",therequest);
    
    NSOperationQueue *queue = [NSOperationQueue mainQueue];
    
    [NSURLConnection sendAsynchronousRequest:therequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
    {
        NSLog(@"\n\n Response through json = %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        
        
        [self handleResponse:nil];
        
//        if (error)
//        {
//            NSLog(@"Some error occured, Reason : %@",[error localizedDescription]);
//            Error *errorObj = [[Error alloc] init];
//            errorObj.message = [NSString stringWithFormat:@"%@",[error localizedDescription]];
//            errorObj.errorType = kErrorTypeNetworkError;
//            [self handleError:errorObj];
//        }
//        else
//        {
//            NSError *jsonError = nil;
//            NSDictionary *json = [NSJSONSerialization
//                                  JSONObjectWithData:data
//                                  options:kNilOptions
//                                  error:&jsonError];
//            NSLog(@"Json Values %@",json);
//            
//            [self responseReceived:json];
//        }
    }];
}

- (void)responseReceived:(NSDictionary*)response
{
    
//    NSLog(@"response as a Dictionary = %@",response);
    self.svcName = [Validator getSVCName:response];
    
//    NSLog(@"self.baseModelDelegate = %@",self.baseModelDelegate);
    
//    if (self.showInvalidSession)
//    {
//        [self.baseModelDelegate logoutForInvalidSession];
//    }
    

    if (response)
    {
        if ([Validator isValidResponse:response])
        {
            [self handleResponse:[response objectForKey:@"response"]];
        }
        else
        {
            Error *errorObj = [Validator getError:response];
            if (errorObj.actionType == kErrorActionTypeSessionTimeOut)
            {
//                [self.baseModelDelegate logoutForInvalidSession];
            }
            else
            {
                [self handleError:errorObj];
            }
        }
    }
    else
    {
        Error *errorObj = [Validator getErrorForNoResponse];
        [self.baseModelDelegate noResponse:errorObj];
    }
}

- (void)handleResponse:(NSDictionary*)response
{

}

- (void)handleError:(Error *)errorObj
{
    
}

- (NSDictionary*)getDataPartFrom:(NSDictionary *)response
{
    return [response objectForKey:@"data"];
}

@end
