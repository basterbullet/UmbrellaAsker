//
//  SetTimeViewController.h
//  UmbrellaAsker
//
//  Created by Yoshida Kannyuu on 2014/05/22.
//  Copyright (c) 2014年 Yoshida Kannyuu. All rights reserved.
//

#import "ViewController.h"
#import "TimeManager.h"

@interface SetTimeViewController : UIViewController
{
}
@property (strong, nonatomic) IBOutlet UIDatePicker *departureTimePicker;
@property (strong, nonatomic) IBOutlet UIDatePicker *arriveTimePicker;

@property (weak, nonatomic) IBOutlet UILabel *showDepartureTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *showArriveTimeLabel;

- (IBAction)DateChanged:(id)sender;
- (IBAction)testShower:(id)sender;

/*
@property (weak, nonatomic) IBOutlet UITextField *departureTimeTextFIeld;
@property (weak, nonatomic) IBOutlet UITextField *arriveTimeTextField;
 */



@end