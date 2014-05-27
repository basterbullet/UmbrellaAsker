//
//  TimeManager.h
//  UmbrellaAsker
//
//  Created by Tatsunori CHINENN on 2014/05/26.
//  Copyright (c) 2014年 Yoshida Kannyuu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeManager : NSObject

-(int) saveToUserDefaultsTime:(NSString*)TIME Tag:(int)TAG;
-(NSString *) loadTimeFromUserDefaultsTag:(int)TAG;

@end
