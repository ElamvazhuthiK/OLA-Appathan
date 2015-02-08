//
//  AppData.h
//  OPX
//
//  Created by Chandrachudh on 6/20/14.
//  Copyright (c) 2014 Market Simplified. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol AppDataDelegate <NSObject>
@end
@interface AppData : NSObject <NSCoding>
@property (nonatomic, weak) id <AppDataDelegate> delegate;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;

+ (id)getObject;
+ (void)loadData;
+ (void)saveData;
@end
