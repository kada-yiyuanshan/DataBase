//
//  DateBaseHelp.h
//  Sqlite_test
//
//  Created by near_shan on 13-6-9.
//  Copyright (c) 2013年 near_shan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "DateBaseBean.h"

@interface DateBaseHelp : NSObject
{
    sqlite3 *datebase;
}
-(void)opendatebase;//打开数据库
-(void)insertTotable:(DateBaseBean *)info;//插入数据
-(void)dele_id:(NSInteger )dateid;//删除数据
-(void)queryTotable:(NSMutableArray *)_arr;//查找数据
-(void)updateTotable:(DateBaseBean *)info update_id:(NSInteger )dateid;//更新数据

@end
