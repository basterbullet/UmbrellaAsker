//
//  LocationViewController.m
//  UmbrellaAsker
//
//  Created by Yoshida Kannyuu on 2014/05/22.
//  Copyright (c) 2014年 Yoshida Kannyuu. All rights reserved.
//

#import "LocationViewController.h"
#import "AppDelegate.h"

@interface LocationViewController ()

@end

@implementation LocationViewController
@synthesize locationManager;
@synthesize mapView;

-(void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    locationManager = [[CLLocationManager alloc] init];
    
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate setController:self];
    
    if ([CLLocationManager locationServicesEnabled]) {
        locationManager.delegate = self;
        [locationManager startUpdatingLocation];
    }else {
        NSLog(@"Locationservices not available.");
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [locationManager stopUpdatingLocation];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *location = [locations objectAtIndex:0];
    float latitude  = location.coordinate.latitude;
    float longitude = location.coordinate.longitude;
    NSLog(@"didUpdateToLocation latitude=%f,longitude=%f",
          latitude,
          longitude);
    showStatusLabel.text = [NSString stringWithFormat:@"緯度=%f,経度=%f",
                            latitude,
                            longitude];
    NSUserDefaults *locationUserDefaults = [NSUserDefaults standardUserDefaults];
    
    [locationUserDefaults setFloat:latitude forKey:@"latitude"];
    [locationUserDefaults setFloat:longitude forKey:@"longitude"];
    

    [mapView setCenterCoordinate:[location coordinate]];

    MKCoordinateRegion cr = mapView.region;
    cr.span.latitudeDelta = 0.5;
    cr.span.longitudeDelta = 0.5;
    [mapView setRegion:cr animated:NO];
    
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    showStatusLabel.text = @"測位失敗 or 位置情報利用不許可";
}

- (IBAction)goBackBtnClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)onResume {
    //    locationManager = nil;
    if (nil == locationManager && [CLLocationManager locationServicesEnabled]) {
        [locationManager startUpdatingLocation];
    }
}

-(void)onPause {
    //    locationManager = nil;
    if (nil == locationManager && [CLLocationManager locationServicesEnabled]) {
        [locationManager stopUpdatingLocation];
    }
}


-(void)didReceiveMemoryWarning {
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