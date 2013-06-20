//
//  ViewController.h
//  Sqlite_test
//
//  Created by near_shan on 13-6-9.
//  Copyright (c) 2013年 near_shan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DateBaseBean.h"
#import "DateBaseHelp.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITextField *name;
    UITableView *tableview;
    NSMutableArray *array;
    DateBaseBean *databasebean;
    DateBaseHelp *databasehelp;
    NSInteger dateid;
}
@property(retain,nonatomic) IBOutlet UIButton *insert;
@property(retain,nonatomic) IBOutlet UIButton *update;
@property(retain,nonatomic) IBOutlet UIButton *delete_date;
@property(retain,nonatomic) IBOutlet UITextField *name;
@property(retain,nonatomic) IBOutlet UITableView *tableview;
@property(retain,nonatomic) NSMutableArray *array;
@property(strong, nonatomic) id detailItem;
@property(assign,nonatomic) NSInteger dateid;

-(IBAction)insert:(id)sender;
-(IBAction)update:(id)sender;
-(IBAction)but:(id)sender;
-(IBAction)delete_date:(id)sender;
@end
