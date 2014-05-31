//
//  SetTimeViewController.m
//  UmbrellaAsker
//
//  Created by Yoshida Kannyuu on 2014/05/22.
//  Copyright (c) 2014年 Yoshida Kannyuu. All rights reserved.
//

#import "SetTimeViewController.h"

@interface SetTimeViewController ()

@end

@implementation SetTimeViewController
@synthesize showDepartureTimeLabel,showArriveTimeLabel, departureTimePicker,arriveTimePicker;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)DateChanged:(id)sender{
    
    //ラベルに表示する日付・時刻のフォーマットを指定
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    df.dateFormat = @"HH時mm分";
    [df setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"JST"]];
    TimeManager *localTimeManager = [[TimeManager alloc]init];
    
    //ラベルに指定したフォーマットで表示
    UIDatePicker *localDatePicker = sender;
    
    // 呼び出し側(sender)の持つtagによって、処理を変更する。
    // View上のラベルを更新し、NSUserDefaultsに保存するため専用クラスを呼び出し
    if (localDatePicker.tag == 1){
        showDepartureTimeLabel.text = [df stringFromDate:localDatePicker.date];
        [localTimeManager saveToUserDefaultsTime:showDepartureTimeLabel.text Tag:localDatePicker.tag];
    }else{
        showArriveTimeLabel.text = [df stringFromDate:localDatePicker.date];
        [localTimeManager saveToUserDefaultsTime:showArriveTimeLabel.text Tag:localDatePicker.tag];
    }
    
}

- (IBAction)testShower:(id)sender {
    /*
    TimeManagerZ *localTimeManager = [[TimeManager alloc]init];
    NSLog([localTimeManager loadTimeFromUserDefaultsTag:2]);
     */
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    _departureTimeTextFIeld.delegate = self;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
