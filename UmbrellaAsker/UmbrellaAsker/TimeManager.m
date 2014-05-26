//
//  TimeManager.m
//  UmbrellaAsker
//
//  Created by Tatsunori CHINENN on 2014/05/26.
//  Copyright (c) 2014年 Yoshida Kannyuu. All rights reserved.
//

#import "TimeManager.h"

@implementation TimeManager

int njikan=200;

-(int)njikanm{
    return njikan;
}

-(int) saveToUserDefaultsTime:(NSString*)TIME Tag:(int)TAG{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:TIME forKey:[[NSNumber numberWithUnsignedInt:TAG] stringValue]];
    return 0;
}

-(NSString *) loadTimeFromUserDefaultsTag:(int)TAG{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *localNSString = [userDefaults stringForKey:[[NSNumber numberWithUnsignedInt:TAG] stringValue]];

    return localNSString;
}

@end
