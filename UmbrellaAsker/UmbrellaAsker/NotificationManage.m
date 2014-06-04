//
//  NotificationManage.m
//  UmbrellaAsker
//
//  Created by Yoshida Kannyuu on 2014/05/22.
//  Copyright (c) 2014年 Yoshida Kannyuu. All rights reserved.
//

#import "NotificationManage.h"

@implementation NotificationManage

// Weather クラスを引数に受け取る
-(void) setLocalNotificationWeather:(Weather*)WEATHER Tag:(int)TAG
{
    if ( 4 <= [WEATHER getWeatherKind] )
    {
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        df.dateFormat = @"HH時mm分";
        [df setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
        TimeManager *localTimeManager = [[TimeManager alloc]init];
        NSDate *departureDate = [df dateFromString:[localTimeManager loadTimeFromUserDefaultsTag:TAG]];
        // NSCalendar を取得します。
        NSCalendar *calendar = [NSCalendar currentCalendar];
        
        // NSDateComponents を作成して、そこに作成したい情報をセットします。
        NSDateComponents *components = [[NSDateComponents alloc] init];
        
        // 日時をカレンダーで年月日時分秒に分解する
        NSDateComponents *nowDate = [calendar components:
                                       NSYearCalendarUnit   |
                                       NSMonthCalendarUnit  |
                                       NSDayCalendarUnit    |
                                       NSHourCalendarUnit   |
                                       NSMinuteCalendarUnit |
                                       NSSecondCalendarUnit
                                                  fromDate:[NSDate date]];

        NSDateComponents *settedDate = [calendar components:
                                       NSYearCalendarUnit   |
                                       NSMonthCalendarUnit  |
                                       NSDayCalendarUnit    |
                                       NSHourCalendarUnit   |
                                       NSMinuteCalendarUnit |
                                       NSSecondCalendarUnit
                                                  fromDate:departureDate];

        
        // NSCalendar を使って、NSDateComponents を NSDate に変換します。
        components.year = nowDate.year;
        components.month = nowDate.month;
        components.day = nowDate.day;
        components.hour = settedDate.hour;
        components.minute = settedDate.minute;
        components.second = settedDate.second;
        
        NSDate *notificationDate = [calendar dateFromComponents:components];
        NSLog(@"%@",notificationDate);
        UILocalNotification *localNotification = [[UILocalNotification alloc] init];
        localNotification.fireDate = notificationDate;
        localNotification.alertBody = @"傘、持ちました？";
        localNotification.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        localNotification.alertAction = @"OPEN";
        localNotification.repeatInterval = NSDayCalendarUnit;
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
        NSLog(@"setup Notification");
    }
}

-(void) removeLocalNotificationWeather
{
}

@end
