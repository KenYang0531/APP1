//
//  AL2ViewController.m
//  AirlineHW2
//
//  Created by Ken Yang on 13/11/4.
//  Copyright (c) 2013年 Ken Yang. All rights reserved.
//

#import "AL2ViewController.h"
#import "DataSourse.h"
#import "ViewController.h"

@interface AL2ViewController ()

@end

@implementation AL2ViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad{}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [[[DataSourse sharedDataSource] arrayWithInitial : _countryname1]count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *inName = [[DataSourse sharedDataSource] arrayWithInitial : _countryname1][section];
    return [[[DataSourse sharedDataSource] arrayWuthAirportInInitial:inName :_countryname1] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell2";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary *city = [[DataSourse sharedDataSource] dictionaryWithAirportAtIndexPath:indexPath:self.countryname1];
    
    UILabel *AITAName = (UILabel *)[cell viewWithTag:1002];
    UILabel *cityName = (UILabel *)[cell viewWithTag:1003];
    UILabel *airportName = (UILabel *)[cell viewWithTag:4];
    
    self.navigationItem.title =city[DataSourceCountryNameKey];
    airportName.text = city[DataSourceAirportNameKey];
    AITAName.text = city[DataSourceIATANameKey];
    cityName.text = city[DataSourceCityNameKey];
    
    return cell;
}

#pragma mark - Table view delegate

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[DataSourse sharedDataSource] arrayWithInitial : _countryname1][section];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"gotodetialscreen"]) {
        UITableViewCell *cell = (UITableViewCell *)sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        NSDictionary *city = [[DataSourse sharedDataSource] dictionaryWithAirportAtIndexPath:indexPath:_countryname1];
        
        ViewController *detailViewController = segue.destinationViewController;
        detailViewController.countryname3 = city;
    }
}

@end
