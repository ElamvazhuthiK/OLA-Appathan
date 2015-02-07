//
//  Error.m
//  OPX
//
//  Created by Chandrachudh on 6/20/14.
//  Copyright (c) 2014 Market Simplified. All rights reserved.
//

#import "Error.h"

@implementation Error

- (id)init
{
    self = [super init];
    if (self)
    {
        self.message = @"";
        self.errorType = kErrorActionTypeNone;
    }
    return self;
}

- (void)dealloc
{
    self.message = nil;
}

@end
