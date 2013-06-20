//
//  ViewController.m
//  Sqlite_test
//
//  Created by near_shan on 13-6-9.
//  Copyright (c) 2013年 near_shan. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize name,tableview,array,dateid;

-(void)dealloc
{
    [databasebean release];
    [databasehelp release];
    [array release];
    [tableview release];
    [name release];
    [super dealloc];
}
#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        [_detailItem release];
        _detailItem = [newDetailItem retain];
    }
}
- (void)viewDidLoad
{
    [self.array removeAllObjects];
    databasebean=[[DateBaseBean alloc] init];
    databasehelp=[[DateBaseHelp alloc] init];
    self.array=[[NSMutableArray alloc]init];
    [self shoedate];
    
    [super viewDidLoad];
    
}
-(IBAction)insert:(id)sender
{
    databasebean.name=name.text;
    [databasehelp insertTotable:databasebean];
    
    [self shoedate];
    [self.tableview reloadData];
    name.text=@"";
}
-(IBAction)update:(id)sender
{
  if (self.detailItem) {
    databasebean=self.detailItem;
    databasebean.name=name.text;
    name.text=@"";
    [databasehelp updateTotable:databasebean update_id:dateid];
    [self.tableview reloadData];
    [self shoedate];
}
}
-(void)shoedate
{
    
    [self.array removeAllObjects];
    [databasehelp queryTotable:self.array];
}
-(IBAction)but:(id)sender
{
    [name resignFirstResponder];
}
-(IBAction)delete_date:(id)sender
{
        [databasehelp dele_id:dateid];
        [self.array removeObjectAtIndex:0];
        [self.tableview reloadData];
        [self shoedate];
}
#pragma tableview delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"count==>%d",[self.array count]);
    return [self.array count];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    DateBaseBean *database=[self.array objectAtIndex:indexPath.section];
    cell.textLabel.text=database.name;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDate *object = [self.array objectAtIndex:indexPath.row];
    DateBaseBean *database=[self.array objectAtIndex:indexPath.section];
    NSInteger a=database._id_;
    self.detailItem=object;
    dateid=a;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
