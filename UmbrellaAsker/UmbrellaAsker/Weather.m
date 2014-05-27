//
//  Weather.m
//  UmbrellaAsker
//
//  Created by Yoshida Kannyuu on 2014/05/22.
//  Copyright (c) 2014年 Yoshida Kannyuu. All rights reserved.
//

#import "Weather.h"

@implementation Weather

// To Do
// load set User Time and latitude , longitude from NSUserDefaults

// and Ask Weather

- (void) getWeatherFromLatLon{
    // OpenWeatherMapの天気出力APIエンドポイント
    NSString *kOpenWeatherMap3HoursForecastAPI = @"http://api.openweathermap.org/data/2.5/weather?units=metric&lat=%f&lon=%f";
    NSString *apiURLfromOpenWeatherMapForecast = @"http://api.openweathermap.org/data/2.5/forecast/daily?lat=%f&lon=%f&cnt=%d&mode=json";
    
    // 適当な緯度経度AF
    CLLocationDegrees latitude = 39.01;
    CLLocationDegrees longitude = 141.68;
    
    NSString *urlString = [NSString stringWithFormat:kOpenWeatherMap3HoursForecastAPI, latitude, longitude];
    NSString *urlStringForecast1day = [NSString stringWithFormat:apiURLfromOpenWeatherMapForecast,latitude, longitude , 1];
    /*
    [[AFHTTPRequestOperationManager manager] GET:urlString
                                      parameters:nil
                                         success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                             NSLog(@"JSON: %@", responseObject);
                                         }
                                         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                             NSLog(@"Error: %@", error);
                                         }];
     */
    [[AFHTTPRequestOperationManager manager] GET:urlStringForecast1day
                                      parameters:nil
                                         success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                             NSLog(@"JSON: %@", responseObject);
                                             NSLog(@"Json catched");

                                             //NSData *jsonData = [responseObject dataUsingEncoding:NSUnicodeStringEncoding];
                                             NSLog(@"Encode checked");
//                                             NSError *error;
//                                             NSArray *array = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments                                                                                              error:&error];
//                                             NSLog(@"JSON Serialized");
                                             //NSString *test = [array objectAtIndex:2];
                                             //NSLog(@"%@",test);
                                         }
                                         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                             NSLog(@"Error: %@", error);
                                         }];

}





@end
