//
//  AppDelegate.h
//  UmbrellaAsker
//
//  Created by Yoshida Kannyuu on 2014/05/22.
//  Copyright (c) 2014年 Yoshida Kannyuu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
@private LocationViewController *controller;
}

@property (strong, nonatomic) UIWindow *window;

-(void)setController:(LocationViewController *)controller_;

@end