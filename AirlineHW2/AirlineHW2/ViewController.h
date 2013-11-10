//
//  ViewController.h
//  AirlineHW2
//
//  Created by Ken Yang on 13/11/4.
//  Copyright (c) 2013年 Ken Yang. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *Airport;
@property (strong, nonatomic) IBOutlet UILabel *IATA;
@property (strong, nonatomic) IBOutlet UILabel *location;
@property (strong, nonatomic) IBOutlet UILabel *City;
@property (strong, nonatomic) IBOutlet UILabel *Country;
@property (strong, nonatomic) IBOutlet UILabel *Latuited;
@property (strong, nonatomic) IBOutlet UILabel *Longtitude;
@property (strong, nonatomic) IBOutlet UIImageView *Image;
- (IBAction)openurl:(id)sender;

@property (weak, nonatomic) NSDictionary *countryname3;

@end
