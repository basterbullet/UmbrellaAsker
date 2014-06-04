//
//  LocationViewController.h
//  UmbrellaAsker
//
//  Created by Yoshida Kannyuu on 2014/05/22.
//  Copyright (c) 2014年 Yoshida Kannyuu. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface LocationViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate> {
    IBOutlet MKMapView *mapView;
    CLLocationManager *locationManager;
    IBOutlet UILabel *showStatusLabel;

    __weak IBOutlet UIBarButtonItem *goTimerBtn;
}

@property (nonatomic, retain)CLLocationManager *locationManager;
@property (nonatomic, retain)IBOutlet MKMapView *mapView;

- (IBAction)goBackBtnClicked:(id)sender;

-(void)onResume;
-(void)onPause;
@end