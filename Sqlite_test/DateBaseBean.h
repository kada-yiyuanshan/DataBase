//
//  DateBaseBean.h
//  Sqlite_test
//
//  Created by near_shan on 13-6-9.
//  Copyright (c) 2013年 near_shan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateBaseBean : NSObject
{
    NSInteger _id_;
    NSString *name;
}

@property(retain,nonatomic) NSString *name;
@property(assign,nonatomic) NSInteger _id_;

-(id)initInsert:(NSInteger )_idbean insertname:(NSString *)_namebean;

@end
