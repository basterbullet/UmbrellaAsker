//
//  ViewController.m
//  UmbrellaAsker
//
//  Created by Yoshida Kannyuu on 2014/05/22.
//  Copyright (c) 2014年 Yoshida Kannyuu. All rights reserved.
//
#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <AFNetworking/AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void) viewDidAppear:(BOOL)animated{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    if ([userDefaults objectForKey:@"isFirst"] != nil)
    {
        MainViewController *moveMainView = [self.storyboard instantiateViewControllerWithIdentifier:@"MainView"];
        [self presentViewController:moveMainView animated:YES completion:nil];
        
        NSLog(@"yahoo");
    }
    [userDefaults setBool:YES forKey:@"isFirst"];
    NSLog(@"%d",[[userDefaults objectForKey:@"isFirst"] boolValue]);

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
