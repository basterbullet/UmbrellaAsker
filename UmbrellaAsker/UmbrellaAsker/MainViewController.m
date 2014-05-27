//
//  ViewController.m
//  UmbrellaAsker
//
//  Created by Yoshida Kannyuu on 2014/05/22.
//  Copyright (c) 2014年 Yoshida Kannyuu. All rights reserved.
//

#import "MainViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <AFNetworking/AFNetworking.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    Weather *weahter = [[Weather alloc] init];
    NSDictionary *basutar = [weahter getWeatherData];
    NSLog(@"バスターバスターバスターバスター%@バスターバスターバスターバスター",basutar);
    //ウィンドウサイズの取得
    CGRect windowSize = [[UIScreen mainScreen] bounds];
    NSLog(@"width:%f height:%f",windowSize.size.width,windowSize.size.height);
    
    CGRect rectA = CGRectMake(0, 0, 400, 600);
    UIImageView *imageViews = [[UIImageView alloc]initWithFrame:rectA];
    imageViews.image = [UIImage imageNamed:@"rain01.png"];
    [self.view addSubview:imageViews];
    
    // アニメーション用画像を配列にセット
    NSMutableArray *imageList = [NSMutableArray array];
    for (NSInteger i = 1; i < 4; i++) {
        NSString *imagePath = [NSString stringWithFormat:@"rain%02d.png", i];
        UIImage *img = [UIImage imageNamed:imagePath];
        [imageList addObject:img];
    }
    
    // アニメーション用画像をセット
    imageViews.animationImages = imageList;
    
    // アニメーションの速度
    imageViews.animationDuration = 0.5;
    
    // アニメーションのリピート回数
    imageViews.animationRepeatCount = 0;
    
    // アニメーション実行
    [imageViews startAnimating];
    
    
    
    
    // UIImageViewの初期化
    CGRect rect = CGRectMake(windowSize.size.width/10, windowSize.size.height/7, 200, 350); //表示位置 x座標、y座標、横幅、高さ　左上が(0,0)
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:rect];
    
    // 画像の読み込み
    imageView.image = [UIImage imageNamed:@"rain.png"];
    
    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageView];
    
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // OpenWeatherMapの天気出力APIエンドポイント
    NSString *kOpenWeatherMap3HoursForecastAPI = @"http://api.openweathermap.org/data/2.5/weather?units=metric&lat=%f&lon=%f";
    
    // 適当な緯度経度AF
    CLLocationDegrees latitude = 39.01;
    CLLocationDegrees longitude = 141.68;
    
    NSString *urlString = [NSString stringWithFormat:kOpenWeatherMap3HoursForecastAPI, latitude, longitude];
    
    [[AFHTTPRequestOperationManager manager] GET:urlString
                                      parameters:nil
                                         success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                             NSLog(@"JSON: %@", responseObject);
                                         }
                                         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                             NSLog(@"Error: %@", error);
                                         }];

    [self.view bringSubviewToFront:testBtn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testBtnClicked:(id)sender {
    Weather *localWeatherManager = [[Weather alloc] init];
    [localWeatherManager getWeatherFromLatLon];
}
@end