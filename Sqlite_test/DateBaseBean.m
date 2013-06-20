//
//  DateBaseBean.m
//  Sqlite_test
//
//  Created by near_shan on 13-6-9.
//  Copyright (c) 2013年 near_shan. All rights reserved.
//

#import "DateBaseBean.h"

@implementation DateBaseBean
@synthesize _id_,name;

-(id)initInsert:(NSInteger)_idbean insertname:(NSString *)_namebean
{
    self=[super init];
    if (self) {
        self._id_=_idbean;
        self.name=_namebean;
    }
    return self;
}
-(void)dealloc
{
    [name release];
    [super dealloc];
}
@end
