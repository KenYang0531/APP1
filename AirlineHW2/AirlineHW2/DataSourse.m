//
//  DataSourse.m
//  AirlineHW2
//
//  Created by Ken Yang on 13/11/4.
//  Copyright (c) 2013年 Ken Yang. All rights reserved.
//

#import "AL1ViewController.h"
#import "AL2ViewController.h"
#import "DataSourse.h"

@interface DataSourse () {
    NSCache *cache;
}

@end

@implementation DataSourse

// Use singleton here
+ (DataSourse *)sharedDataSource {
    static DataSourse *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

#pragma mark - Object lifecycle

- (id)init {
    if (self = [super init]) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"AirportList" ofType:@"plist"];
        cityList = [NSArray arrayWithContentsOfFile:path];
        cache = [[NSCache alloc] init];
    }
    return self;
}

#pragma mark - Method

- (void)cleanCache {
    [cache removeAllObjects];
}

- (NSArray *)arrayWithCountry {
    NSString *cacheKey = @"DataSource.arrayWithCountry";
    NSArray *result = [cache objectForKey:cacheKey];
    if (!result) {
        // Cannot get result from cache. Generate it
                
        // Use set to remove duplicate continent name
        NSMutableSet *countrySet = [NSMutableSet set];
        for (NSDictionary *city in cityList) {
            [countrySet addObject:city[DataSourceCountryNameKey]];
        }
        result = [countrySet allObjects];
        
        // Sort this list
        result = [result sortedArrayUsingComparator:^NSComparisonResult(NSString *continent1, NSString *continent2) {
            return [continent1 compare:continent2];
        }];
        
        // Save it back to cache
        [cache setObject:result forKey:cacheKey];
    }
    return result;
}

- (NSArray *)arrayWithInitial:(NSString *)countryName {

    NSString *cacheKey = [NSString stringWithFormat:@"CLDataSource.arrayWithInitial-%@",countryName];
    NSArray *result = [cache objectForKey:cacheKey];
    if (!result) {
        // Cannot get result from cache. Generate it

        // Use set to remove duplicate continent name
        NSMutableSet *initialSet = [NSMutableSet set];
        NSArray *temp3 = [self arrayWithAirportInCountry : countryName ];
        for (NSDictionary *city in  temp3) {
            NSString *temp2 = city[DataSourceAirportNameKey];
            temp2 = [temp2 substringToIndex:1];
            [initialSet addObject: temp2];
        }
        result = [initialSet allObjects];
        
        // Sort this list
        result = [result sortedArrayUsingComparator:^NSComparisonResult(NSString *continent1, NSString *continent2) {
            return [continent1 compare:continent2];
        }];
        
        // Save it back to cache
        [cache setObject:result forKey:cacheKey];
    }
    return result;
}

- (NSArray *)arrayWithAirportInCountry : (NSString *)countryName {
    NSString *cacheKey = [NSString stringWithFormat:@"CLDataSource.arrayWithCityInContinent-%@", countryName];
    NSArray *result = [cache objectForKey:cacheKey];
    if (!result) {
        // Cannot get result from cache. Generate it
        
        // Use NSPredicate to filter array
        NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(NSDictionary *city, NSDictionary *bindings) {
            return [ city[DataSourceCountryNameKey] isEqualToString:countryName];
        }];
        result = [cityList filteredArrayUsingPredicate:predicate];
        
        // Sort this list
        result = [result sortedArrayUsingComparator:^NSComparisonResult(NSDictionary *city1, NSDictionary *city2) {
            return [city1[DataSourceAirportNameKey] compare:city2[DataSourceAirportNameKey]];
        }];
    
        // Save it back to cache
        [cache setObject:result forKey:cacheKey];
        
    }
    return result;
}

- (NSArray *)arrayWuthAirportInInitial : (NSString *)initialletter : (NSString *) name{

    NSString *cacheKey = [NSString stringWithFormat:@"CLDataSource.arrayWithCityInInitial-%@", initialletter];
    NSArray *result = [cache objectForKey:cacheKey];
    if (!result) {
        // Cannot get result from cache. Generate it
        
        // Use NSPredicate to filter array
        NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(NSDictionary *city, NSDictionary *bindings) {
            NSString *temp2 = city[DataSourceAirportNameKey];
            temp2 = [temp2 substringToIndex:1];
            return [ temp2 isEqualToString:initialletter];
        }];
        result = [cityList filteredArrayUsingPredicate:predicate];
        
        NSPredicate *predicate2 = [NSPredicate predicateWithBlock:^BOOL(NSDictionary *city, NSDictionary *bindings) {
            return [ city[DataSourceCountryNameKey] isEqualToString: name];
        }];
        result = [result filteredArrayUsingPredicate:predicate2];
        
        // Sort this list
        result = [result sortedArrayUsingComparator:^NSComparisonResult(NSDictionary *city1, NSDictionary *city2) {
            return [city1[DataSourceAirportNameKey] compare:city2[DataSourceAirportNameKey]];
        }];
        
        // Save it back to cache
        [cache setObject:result forKey:cacheKey];
        
    }
    return result;

}

- (NSString *)dictionaryWithcountryAtIndexPath:(NSIndexPath *)indexPath {

    NSString *cityname = [self arrayWithCountry][indexPath.row];
    return cityname;
}

- (NSDictionary *)dictionaryWithAirportAtIndexPath: (NSIndexPath *) indexPath: (NSString *) name {

    NSString *continentName = [self arrayWithInitial:name][indexPath.section];
    NSDictionary *city = [self arrayWuthAirportInInitial:continentName:name][indexPath.row];

    return city;
}

@end
