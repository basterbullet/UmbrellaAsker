//
//  ViewController.m
//  UmbrellaAsker
//
//  Created by Yoshida Kannyuu on 2014/05/22.
//  Copyright (c) 2014年 Yoshida Kannyuu. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <AFNetworking/AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // OpenWeatherMapの天気出力APIエンドポイント
    NSString *kOpenWeatherMap3HoursForecastAPI = @"http://api.openweathermap.org/data/2.5/weather?units=metric&lat=%f&lon=%f";
    
    // 適当な緯度経度AF
    CLLocationDegrees latitude = 39.01;
    CLLocationDegrees longitude = 141.68;
    
    NSString *urlString = [NSString stringWithFormat:kOpenWeatherMap3HoursForecastAPI, latitude, longitude];
    
    [[AFHTTPRequestOperationManager manager] GET:urlString
                                      parameters:nil
                                         success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                             NSLog(@"JSON: %@", responseObject);
                                         }
                                         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                             NSLog(@"Error: %@", error);
                                         }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
