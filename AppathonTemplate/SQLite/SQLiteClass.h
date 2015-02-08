//
//  SQLiteClass.h
//  AppathonTemplate
//
//  Created by abhilash on 07/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface SQLiteClass : NSObject
{
    //sqlite3 *appathonDB;
}
@property (nonatomic, assign) sqlite3 *appathonDB;

+ (SQLiteClass *)sharedInstance;

-(void) closeAppathonDBFile;

#pragma mark - INSERT

// A common method to execute for all sql inserting query.
-(BOOL) commonMethodForAllInsertQuriesExcuetionQuery:(NSString*)insertQuery andDataFromServer:(BOOL) dataFromServer;

#pragma mark - SELECT

// This method return array with out object as dictionary.
-(NSMutableArray*) commonMethodForAllSelectQuriesExcuetionQueryReturnWithArrayOfObject:(NSString*)selectQuery;
@end
