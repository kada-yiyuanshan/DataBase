//
//  DateBaseHelp.m
//  Sqlite_test
//
//  Created by near_shan on 13-6-9.
//  Copyright (c) 2013年 near_shan. All rights reserved.
//

#import "DateBaseHelp.h"

@implementation DateBaseHelp

#define DB_NAME @"name.sqlite"

- (id)init
{
    self = [super init];
    if (self) {
        [self opendatebase];
    }
    
    return self;
}
- (NSString *)dataFilePath
{
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:DB_NAME];
    success = [fileManager fileExistsAtPath:writableDBPath];
    if (!success) {
        NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:DB_NAME];
        success = [fileManager copyItemAtPath:defaultDBPath toPath:
                   writableDBPath error:&error];
        if (!success) {
            
        }
    }
    return writableDBPath;
}
-(void)opendatebase
{
    int open=sqlite3_open([self.dataFilePath UTF8String], &datebase);
    if (open!=SQLITE_OK) {
        NSLog(@"open datebase error");
        sqlite3_close(datebase);
    }

}
-(void)insertTotable:(DateBaseBean *)info
{
    char *error;
    NSString *sqlite=[NSString stringWithFormat:@"insert into  name (name) VALUES ('%@')",info.name];
    int insert=sqlite3_exec(datebase, [sqlite UTF8String], NULL, NULL,&error);
    if (insert!=SQLITE_OK) {
        NSLog(@"insert date to database error");
        sqlite3_close(datebase);
    }else
    {
    NSLog(@"insert date to database ok");
    }
}
-(void)updateTotable:(DateBaseBean *)info update_id:(NSInteger )dateid
{
    char *error;
    NSString *update_sqlite=[NSString stringWithFormat:@"update name set name= '%@' where id=%d",info.name,dateid];
    int update=sqlite3_exec(datebase,[update_sqlite UTF8String],NULL,NULL,&error);
    if (update!=SQLITE_OK) {
        NSLog(@"update to table error");
        sqlite3_close(datebase);
    }
}
-(void)dele_id:(NSInteger )dateid
{
    char *error;
    NSString *delete_sqlite=[NSString stringWithFormat:@"delete from name where id=%d;",dateid];
    int delete=sqlite3_exec(datebase,[delete_sqlite UTF8String],NULL,NULL,&error);
    if (delete!=SQLITE_OK) {
        NSLog(@"delete date from database error");
        sqlite3_close(datebase);
    }
}
-(void)queryTotable:(NSMutableArray *)_arr
{
    sqlite3_stmt *statumt=nil;
    NSString *query_sqlite=@"select * from name ";
    int query=sqlite3_prepare_v2(datebase,[query_sqlite UTF8String],-1,&statumt,nil);
    if (query==SQLITE_OK) {
        while (sqlite3_step(statumt)==SQLITE_ROW) {
            NSInteger _id=sqlite3_column_int(statumt, 0);
			NSString *name=[[NSString alloc] initWithCString:(char *)sqlite3_column_text(statumt, 1) encoding:NSUTF8StringEncoding];
            DateBaseBean *bean=[[DateBaseBean alloc] initInsert:_id insertname:name ];
            [_arr addObject:bean];
            NSLog(@"_id=>%d  name==>%@",_id,name);
            [name release];
        }
        sqlite3_finalize(statumt);
        statumt=nil;
    }else
    {
        sqlite3_close(datebase);
    }
    [query_sqlite release];
}
@end
