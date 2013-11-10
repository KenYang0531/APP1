//
//  DataSourse.h
//  AirlineHW2
//
//  Created by Ken Yang on 13/11/4.
//  Copyright (c) 2013年 Ken Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AL2ViewController.h"

#define DataSourceAirportNameKey @"Airport name"
#define DataSourceIATANameKey @"IATA"
#define DataSourceLocalizeNameKey @"Localized Name"
#define DataSourceCityNameKey @"City"
#define DataSourceCountryNameKey @"Country"
#define DataSourceLatitudeNameKey @"Latitude"
#define DataSourseLongtitudeNameKey @"Longitude"
#define DataSourceImageNameKey @"Image URL"
#define DataSourceWikipediaNameKey @"Wikipedia URL"

@interface DataSourse : NSObject {
    NSArray *cityList;
}

+ (DataSourse *)sharedDataSource;

- (void)cleanCache;

- (NSArray *)arrayWithCountry;
- (NSArray *)arrayWithInitial:(NSString *)countryName;
- (NSArray *)arrayWithAirportInCountry : (NSString *)countryName;
- (NSArray *)arrayWuthAirportInInitial : (NSString *)initialletter :(NSString *) name;
- (NSString *)dictionaryWithcountryAtIndexPath:(NSIndexPath *)indexPath;
- (NSDictionary *)dictionaryWithAirportAtIndexPath:(NSIndexPath *)indexPath :(NSString *) name;

@end
