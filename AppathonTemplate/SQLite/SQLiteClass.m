//
//  SQLiteClass.m
//  AppathonTemplate
//
//  Created by abhilash on 07/02/15.
//  Copyright (c) 2015 Market Simplified. All rights reserved.
//

#import "SQLiteClass.h"
#define EMPTY_STRING @""

@implementation SQLiteClass
@synthesize appathonDB;

+ (SQLiteClass *)sharedInstance
{
    static SQLiteClass *sqliteSharedInstance = nil;
    
    if (sqliteSharedInstance == nil)
    {
        sqliteSharedInstance = [super init];
    }
    return sqliteSharedInstance;
}

- (NSString*) dataBaseFilePath
{
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *writableDBPath= [[NSString alloc] initWithString: [filePath stringByAppendingPathComponent: @"Appathon.sqlite"]];
    return writableDBPath;
}

//Data base file path.
- (NSString *)copyIfDBNeeded
{
    NSString *writableDBPath= [self dataBaseFilePath];
    
    // Data base file existing checking.
    //if ([CommonMethodClass isFileExistsAtPath:[self dataBaseFilePath]])
    {
        if (!appathonDB)
        {
            sqlite3_shutdown();
            if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
            {
                NSLog(@"Can now use sqlite on multiple threads, using the same connection");
            }
            if(SQLITE_OK == sqlite3_initialize())
            {
                NSLog(@"Database is intialized");
                sqlite3_open([writableDBPath UTF8String], &appathonDB);
            }
            else
            {
                NSLog(@" Database is Not intialized");
            }
        }
    }
    return writableDBPath;
}

-(void) closeAppathonDBFile
{
    // Appathon db not opened.
    if (appathonDB)
    {
        // Close db file.
        sqlite3_close(appathonDB);
        
        appathonDB = nil;
    }
}

#pragma mark - INSERT 

// A common method to execute for all sql inserting query.
-(BOOL) commonMethodForAllInsertQuriesExcuetionQuery:(NSString*)insertQuery andDataFromServer:(BOOL) dataFromServer
{
    NSLog(@"IQ : %@", insertQuery);
    BOOL returnValue = YES;
    
    // DB not opened. Open it first.
    if (![SQLiteClass sharedInstance].appathonDB)
    {
        [[SQLiteClass sharedInstance] copyIfDBNeeded];
    }
    
    sqlite3_stmt *insertStmt = nil;
    
    if (sqlite3_config(SQLITE_CONFIG_SERIALIZED) == SQLITE_OK)
    {
        NSLog(@"Can now use sqlite on multiple threads, using the same connection");
    }
    
    // Data base file existing checking.
    //if ([CommonMethodClass isFileExistsAtPath:[self dataBaseFilePath]])
    {
        if(insertStmt == nil)
        {
            const char *sql = [insertQuery UTF8String];
            
            
            if(sqlite3_prepare_v2(appathonDB, sql, -1, &insertStmt, NULL) != SQLITE_OK)// preparing statement.
            {
                NSLog(@"Error while creating addStmt in addRecipeToDatabase %@", [NSString stringWithUTF8String:(char *)sqlite3_errmsg(appathonDB)]);
                returnValue = NO;
            }
            
        }
        
        if(SQLITE_DONE != sqlite3_step(insertStmt))// Execute sqlite statement.
        {
            NSLog(@"Error while Executing addStmt in addRecipeToDatabase %@", [NSString stringWithUTF8String:(char *)sqlite3_errmsg(appathonDB)]);
            returnValue = NO;
        }
        // reseting statement.
        sqlite3_reset(insertStmt);
        
        if (insertStmt)
        {
            // finalizing statement.
            sqlite3_finalize(insertStmt);
            insertStmt = nil;
        }
    }
    return YES;
}

#pragma mark - SELECT

// This method return array with out object as dictionary.
-(NSMutableArray*) commonMethodForAllSelectQuriesExcuetionQueryReturnWithArrayOfObject:(NSString*)selectQuery
{
    
    // DB not opened. Open it first.
    if (![SQLiteClass sharedInstance].appathonDB)
    {
        [[SQLiteClass sharedInstance] copyIfDBNeeded];
    }
    sqlite3_stmt *selectStatement=nil;// sqlite statement.
    
    NSMutableArray *returnDataArray=[[NSMutableArray alloc] init];
    
    // Data base file existing checking.
    //if ([CommonMethodClass isFileExistsAtPath:[self dataBaseFilePath]])
    {
        NSLog(@"SQ: %@", selectQuery);
        if (sqlite3_prepare_v2(appathonDB, [selectQuery UTF8String], -1, &selectStatement, NULL)==SQLITE_OK)// preparing statement.
        {
            while (sqlite3_step(selectStatement)==SQLITE_ROW)// getting each row at time.
            {
                // Column count.
                int columnCount = sqlite3_column_count(selectStatement);
                
                // getting each column at time.
                for (int i = 0; i < columnCount; i++)
                {
                    // Column type.
                    int type = sqlite3_column_type(selectStatement, i);
                    
                    // Column Name.
                    //NSString *columnName = [NSString stringWithUTF8String:(char *)sqlite3_column_name(selectStatement, i)];
                    
                    if (type == SQLITE_INTEGER)
                    {
                        // Column Value.
                        int columnValue =sqlite3_column_int(selectStatement, i);
                        
                        [returnDataArray addObject:[NSNumber numberWithInt:columnValue]];
                    }
                    else if (type == SQLITE_FLOAT)
                    {
                        // Column Value.
                        float columnValue =sqlite3_column_double(selectStatement, i);
                        
                        [returnDataArray addObject:[NSNumber numberWithFloat:(float)columnValue]];
                    }
                    else if (type == SQLITE_TEXT)
                    {
                        char *value = ( char *)sqlite3_column_text(selectStatement, i);
                        if (value == nil)
                        {
                            // Column Value.
                            NSString *columnValue = EMPTY_STRING;
                            
                            [returnDataArray addObject:columnValue];
                        }
                        else
                        {
                            // Column Value.
                            NSString *columnValue =[NSString stringWithUTF8String:value];
                            
                            [returnDataArray addObject:columnValue];
                        }
                    }
                    else if(type == SQLITE_BLOB)
                    {
                    }
                    else if (type == SQLITE_NULL)
                    {
                        char *value = ( char *)sqlite3_column_text(selectStatement, i);
                        if (value ==nil)
                        {
                            // Column Value.
                            NSString *columnValue = EMPTY_STRING;
                            
                            [returnDataArray addObject:columnValue];
                            
                        }
                        else
                        {
                            // Column Value.
                            NSString *columnValue =[NSString stringWithUTF8String:value];
                            
                            [returnDataArray addObject:columnValue];
                        }
                    }
                }
            }
        }
        sqlite3_reset(selectStatement);// reseting statement.
        if (selectStatement)
        {
            sqlite3_finalize(selectStatement);// finalizing statement.
            selectStatement=nil;
        }
    }
    
    return returnDataArray;
}

@end
