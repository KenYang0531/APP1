//
//  AL1ViewController.m
//  AirlineHW2
//
//  Created by Ken Yang on 13/11/4.
//  Copyright (c) 2013年 Ken Yang. All rights reserved.
//

#import "AL1ViewController.h"
#import "AL2ViewController.h"
#import "DataSourse.h"

@interface AL1ViewController ()

@end

@implementation AL1ViewController

- (void)viewDidLoad {}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[DataSourse sharedDataSource] arrayWithCountry] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath :indexPath];
    
    // Configure the cell...
    NSString *city = [[DataSourse sharedDataSource] dictionaryWithcountryAtIndexPath:indexPath];

    UILabel *countryName = (UILabel *)[cell viewWithTag:0];
    countryName.text = city;
    
    return cell;
}

#pragma mark - Table view delegate

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return nil;
}


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"gotoscreen2"]) {
        UITableViewCell *cell = (UITableViewCell *)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        NSString *city = [[DataSourse sharedDataSource] dictionaryWithcountryAtIndexPath:indexPath];
        
        AL2ViewController *detailViewController = segue.destinationViewController;
        detailViewController.countryname1 = city;
    }
}

@end
