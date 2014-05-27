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
    NSString *apiURLfromOpenWeatherMapForecast = @"http://api.openweathermap.org/data/2.5/forecast/daily?lat=%f&lon=%f&cnt=%d&mode=json";
    
    // 適当な緯度経度AF
    NSUserDefaults *locationUserDefaults = [NSUserDefaults standardUserDefaults];
    float latitude  = [locationUserDefaults floatForKey:@"latitude"];
    float longitude = [locationUserDefaults floatForKey:@"longitude"];
//    CLLocationDegrees latitude = 39.01;
//    CLLocationDegrees longitude = 141.68;
    
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
    NSDictionary *test;
    [[AFHTTPRequestOperationManager manager] GET:urlStringForecast1day
                                      parameters:test
                                         success:^(AFHTTPRequestOperation *operation, id responseObject)
                                         {
                                             NSLog(@"JSON: %@", responseObject);
                                             NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:operation.responseData options:0 error:nil];
                                             //test = [jsonDictionary objectForKey:@"list"];
                                             NSLog(@"ほげ%@ほげ",[jsonDictionary objectForKey:@"list"]);
                                             NSLog(@"====================");
                                             [self setWeather:jsonDictionary];
                                         }
     
                                         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                             NSLog(@"Error: %@", error);
                                         }];
    NSLog(@"%@",test);
//    NSLog(@"%@",[jsonDictionary objectForKey:@"list"]);
 
}

-(void)setWeather:(NSDictionary *)jsonDictionary_ {
    json = jsonDictionary_;
}

-(NSDictionary *)getWeatherData {
    return json;
}
/*
- (void) test
{
}
*/



@end
