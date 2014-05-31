//
//  NotificationManage.h
//  UmbrellaAsker
//
//  Created by Yoshida Kannyuu on 2014/05/22.
//  Copyright (c) 2014年 Yoshida Kannyuu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"
#import "TimeManager.h"
@interface NotificationManage : NSObject

-(void)setLocalNotificationWeather:(Weather*)WEATHER Tag:(int)TAG;
-(void)removeLocalNotificationWeather;

@end
