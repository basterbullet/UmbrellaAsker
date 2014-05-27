//
//  Weather.h
//  UmbrellaAsker
//
//  Created by Yoshida Kannyuu on 2014/05/22.
//  Copyright (c) 2014年 Yoshida Kannyuu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <AFNetworking/AFNetworking.h>

@interface Weather : NSObject
{
    NSDictionary *json;
}

- (void) getWeatherFromLatLon;
-(NSDictionary *)getWeatherData;
@end
