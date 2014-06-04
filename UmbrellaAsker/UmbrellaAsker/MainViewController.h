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
#import <AVFoundation/AVFoundation.h>

@interface MainViewController : UIViewController<AVAudioPlayerDelegate>
{
    Weather *localWeatherManager;
    __weak IBOutlet UIButton *goTimeViewBtn;
    __weak IBOutlet UIButton *goLocateViewBtn;
}

@property(nonatomic,retain)AVAudioPlayer *audio;

- (void)setBackGroundSunny;
- (void)setBackGroundCloud;
- (void)setBackGroundRain;


@end