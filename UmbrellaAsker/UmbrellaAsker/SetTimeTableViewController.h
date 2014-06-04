//
//  CpTableViewController.h
//  UmbrellaAsker
//
//  Created by Tatsunori CHINENN on 2014/06/03.
//  Copyright (c) 2014年 Yoshida Kannyuu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeManager.h"

@interface SetTimeTableViewController : UITableViewController
{
    __weak IBOutlet UIButton *endSettingBtn;
    NSString *kDateCellID;
    // the cells with the start or end date
    NSString *kDatePickerID;
    // the cell containing the date picker
    NSString *kOtherCell;
    // the remaining cells at the end
}

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;

// keep track which indexPath points to the cell with UIDatePicker
@property (nonatomic, strong) NSIndexPath *datePickerIndexPath;

@property (assign) NSInteger pickerCellRowHeight;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) IBOutlet UIDatePicker *pickerView;

// this button appears only when the date picker is shown (iOS 6.1.x or earlier)
@property (nonatomic, strong) IBOutlet UIBarButtonItem *doneButton;

- (IBAction)backBtnClicked:(id)sender;
@end
