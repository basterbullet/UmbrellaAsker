//
//  ViewController.h
//  UmbrellaAsker
//
//  Created by Yoshida Kannyuu on 2014/05/22.
//  Copyright (c) 2014年 Yoshida Kannyuu. All rights reserved.
//

//#import "ViewController.h"
#import <UIKit/UIKit.h>
#import "Weather.h"
#import "NotificationManage.h"

@interface MainViewController : UIViewController
{
    Weather *localWeatherManager;
    __weak IBOutlet UIButton *goTimeViewBtn;
    __weak IBOutlet UIButton *goLocateViewBtn;
}

- (void)setBackGroundSunny;
- (void)setBackGroundCloud;
- (void)setBackGroundRain;

@end