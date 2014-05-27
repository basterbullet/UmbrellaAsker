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

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *location = [locations objectAtIndex:0];
    float latitude  = location.coordinate.latitude;
    float longitude = location.coordinate.longitude;
    NSLog(@"didUpdateToLocation latitude=%f,longitude=%f",
          latitude,
          longitude);
    NSUserDefaults *locationUserDefaults = [NSUserDefaults standardUserDefaults];
    
    [locationUserDefaults setFloat:latitude forKey:@"latitude"];
    [locationUserDefaults setFloat:longitude forKey:@"longitude"];
    
//    NSString *latitudeStr  = [NSString stringWithFormat:@"%f",latitude];
//    NSString *longitudeStr = [NSString stringWithFormat:@"%f",longitude];
//    [locationUserDefaults setObject:latitudeStr forKey:@"latitude"];
//    [locationUserDefaults setObject:longitudeStr forKey:@"longitude"];
    

    
//    [userDefaults setObject:[[[TIME forKey:[[NSNumber numberWithUnsignedInt:TAG] stringValue]];

    //    NSLog(@"%@",[locations lastObject]);
    [mapView setCenterCoordinate:[location coordinate]];
    //    [mapView setRegion:region];
    MKCoordinateRegion cr = mapView.region;
    cr.span.latitudeDelta = 0.5;
    cr.span.longitudeDelta = 0.5;
    [mapView setRegion:cr animated:NO];
    
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"測位失敗 or 位置情報利用不許可");
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