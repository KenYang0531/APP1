//
//  ViewController.m
//  AirlineHW2
//
//  Created by Ken Yang on 13/11/4.
//  Copyright (c) 2013年 Ken Yang. All rights reserved.
//

#import "ViewController.h"
#import "AL2ViewController.h"
#import "DataSourse.h"

@interface ViewController () {
    NSCache *cache2;
}

@end

@implementation ViewController


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationItem.title = self.countryname3[DataSourceIATANameKey];
    self.Airport.text = self.countryname3[DataSourceAirportNameKey];
    self.IATA.text = self.countryname3[DataSourceIATANameKey];
    self.location.text = self.countryname3[DataSourceLocalizeNameKey];
    self.location.text = self.countryname3[DataSourceLocalizeNameKey];
    self.City.text = self.countryname3[DataSourceCityNameKey];
    self.Country.text = self.countryname3[DataSourceCountryNameKey];
    self.Longtitude.text = [NSString stringWithFormat:@"%@", self.countryname3[DataSourseLongtitudeNameKey]];
    self.Latuited.text = [NSString stringWithFormat:@"%@", self.countryname3[DataSourceLatitudeNameKey]];

    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.countryname3[DataSourceImageNameKey]]]];
    self.Image.image = image;
    
//    NSString *cacheKey = [NSString stringWithFormat:@"CLDataSource.Image-%@", self.countryname3[DataSourceAirportNameKey]];
//    UIImage *result = [cache2 objectForKey:cacheKey];
//    NSLog(@"key1;;%@",cacheKey);
//    if (!result) {
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.countryname3[DataSourceImageNameKey]]]];
//        self.Image.image = image;
//        [cache2 setObject:image forKey:cacheKey];
//        NSLog(@"key2;;%@",cacheKey);
//        NSLog(@"Create cache");
//        if (![cache2 objectForKey:cacheKey]){
//            NSLog(@"Error");
//        }
//    }
//    else {
//        self.Image.image = result;
//        NSLog(@"Run cache");
//    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openurl:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.countryname3[DataSourceWikipediaNameKey]]];
}
@end
