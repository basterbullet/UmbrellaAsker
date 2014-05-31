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
//    NSUserDefaults *locationUserDefaults = [NSUserDefaults standardUserDefaults];
//    float latitude  = [locationUserDefaults floatForKey:@"latitude"];
//    float longitude = [locationUserDefaults floatForKey:@"longitude"];
    //CLLocationDegrees latitude = 26.4;
    CLLocationDegrees latitude = 26.252727;
    //CLLocationDegrees longitude = 127.8;
    CLLocationDegrees longitude = 127.76656300000002;
    
    NSString *urlStringForecast1day = [NSString stringWithFormat:apiURLfromOpenWeatherMapForecast,latitude, longitude , 1];

    // 同期処理のために必要。
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

    NSDictionary *test;
    [[AFHTTPRequestOperationManager manager] GET:urlStringForecast1day
                                      parameters:test
                                         success:^(AFHTTPRequestOperation *operation, id responseObject)
                                         {
                                             // 通信成功時の処理
                                             NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:operation.responseData options:0 error:nil];
                                             // 帰ってきたデータが入っているresponseObjectを
                                             // NSDictionary形式へシリアライズ

                                             NSLog(@"====================");
                                             // 求められたデータを、呼び出し側へ受け渡すメソッドを呼び出し。
                                             [self setWeather:jsonDictionary];
                                             // 同期処理の為必要。
                                             dispatch_semaphore_signal(semaphore);
                                         }
                                         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                             // 通信失敗時の処理
                                             NSLog(@"Error: %@", error);
                                             dispatch_semaphore_signal(semaphore);
                                         }];
    while(dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW))
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1f]];
 
}

-(void)setWeather:(NSDictionary *)jsonDictionary_ {
    json = jsonDictionary_;
}

-(NSDictionary *)getWeatherData {
    return json;
}

// 外部からの呼び出し向け、天気の晴れ・雨度合いを整数で返す。
-(int)getWeatherKind{
    [self getWeatherFromLatLon];
    NSString *localStr = [NSString stringWithFormat:@"%@",json ];

    // 複数行のデータから、天気の晴れ・雨度合いを端的に表せる一行を読み込む。
    [localStr enumerateLinesUsingBlock:^(NSString *line, BOOL *stop) {
        NSRange findChecker = [line rangeOfString:@"icon"];
        
        if ( findChecker.location != NSNotFound)
        {
            // 発見した一行を、整数レベルまで分解する処理
            NSArray *localArray = [line componentsSeparatedByString:@" "];
            localArray = [[localArray objectAtIndex:22] componentsSeparatedByString:@";"];
            NSString *strParts = [localArray objectAtIndex:0];
            NSLog(@"str = %@",strParts);
            NSLog(@"int = %d",[strParts substringToIndex:2].intValue);
            returnValue = [strParts substringToIndex:2].intValue;
        }
    }];

    return returnValue;
}

@end
