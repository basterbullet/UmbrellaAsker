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
    localWeatherManager = [[Weather alloc] init];
    //int indicateWeather = [localWeatherManager getWeatherKind];
    int indicateWeather = 10;
    // getWeatherKindの返り値によって、MainViewControllerの背景などを変更する処理です。
    NSLog(@"%d",indicateWeather);
    if ( 2 >= indicateWeather){
        [self setBackGroundSunny];
    }else if( 4 >= indicateWeather){
        [self setBackGroundCloud];
    }else{
        [self setBackGroundRain];
    }
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // ストーリーボード上で配置したUIViewを、最前面に配置し直します。
    [self.view bringSubviewToFront:goLocateViewBtn];
    [self.view bringSubviewToFront:goTimeViewBtn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setBackGroundSunny
{
    //ウィンドウサイズの取得
    CGRect windowSize = [[UIScreen mainScreen] bounds];
    NSLog(@"width:%f height:%f",windowSize.size.width,windowSize.size.height);
    
    
    CGRect rectA = CGRectMake(0, 0, 400, 600);
    UIImageView *imageViews = [[UIImageView alloc]initWithFrame:rectA];
    imageViews.image = [UIImage imageNamed:@"sunny01.png"];
    [self.view addSubview:imageViews];
    
    // アニメーション用画像を配列にセット
    NSMutableArray *imageList = [NSMutableArray array];
    for (NSInteger i = 1; i < 4; i++) {
        NSString *imagePath = [NSString stringWithFormat:@"sunny%02d.png", i];
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
    
    CGRect man = CGRectMake(windowSize.size.width/10, windowSize.size.height/7, 220, 300);
    UIImageView *imageViewMan = [[UIImageView alloc]initWithFrame:man];
    imageViewMan.image = [UIImage imageNamed:@"sunnyman01.png"];
    [self.view addSubview:imageViewMan];
    
    // アニメーション用画像を配列にセット
    NSMutableArray *imageListMan = [NSMutableArray array];
    for (NSInteger i = 1; i < 3; i++) {
        NSString *imagePath = [NSString stringWithFormat:@"sunnyman%02d.png", i];
        UIImage *img = [UIImage imageNamed:imagePath];
        [imageListMan addObject:img];
    }
    
    // アニメーション用画像をセット
    imageViewMan.animationImages = imageListMan;
    
    // アニメーションの速度
    imageViewMan.animationDuration = 1.0;
    
    // アニメーションのリピート回数
    imageViewMan.animationRepeatCount = 0;
    
    // アニメーション実行
    [imageViewMan startAnimating];
    
}


- (void) setBackGroundRain
{
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
    
    CGRect man = CGRectMake(windowSize.size.width/10, windowSize.size.height/7, 220, 300);
    UIImageView *imageViewMan = [[UIImageView alloc]initWithFrame:man];
    imageViewMan.image = [UIImage imageNamed:@"rainman01-1.png"];
    [self.view addSubview:imageViewMan];
    
    // アニメーション用画像を配列にセット
    NSMutableArray *imageListMan = [NSMutableArray array];
    for (NSInteger i = 1; i < 3; i++) {
        NSString *imagePath = [NSString stringWithFormat:@"rainman%02d-1.png", i];
        UIImage *img = [UIImage imageNamed:imagePath];
        [imageListMan addObject:img];
    }
    
    // アニメーション用画像をセット
    imageViewMan.animationImages = imageListMan;
    
    // アニメーションの速度
    imageViewMan.animationDuration = 1.0;
    
    // アニメーションのリピート回数
    imageViewMan.animationRepeatCount = 0;
    
    // アニメーション実行
    [imageViewMan startAnimating];

}

- (void) setBackGroundCloud
{
    //ウィンドウサイズの取得
    CGRect windowSize = [[UIScreen mainScreen] bounds];
    NSLog(@"width:%f height:%f",windowSize.size.width,windowSize.size.height);
    
    
    CGRect rectA = CGRectMake(0, 0, 400, 600);
    UIImageView *imageViews = [[UIImageView alloc]initWithFrame:rectA];
    imageViews.image = [UIImage imageNamed:@"cloud01.png"];
    [self.view addSubview:imageViews];
    
    // アニメーション用画像を配列にセット
    NSMutableArray *imageList = [NSMutableArray array];
    for (NSInteger i = 1; i < 4; i++) {
        NSString *imagePath = [NSString stringWithFormat:@"cloud%02d.png", i];
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
    
    
    
    
    
    CGRect man = CGRectMake(windowSize.size.width/10, windowSize.size.height/7, 220, 300);
    UIImageView *imageViewMan = [[UIImageView alloc]initWithFrame:man];
    imageViewMan.image = [UIImage imageNamed:@"cloudman01.png"];
    [self.view addSubview:imageViewMan];
    
    // アニメーション用画像を配列にセット
    NSMutableArray *imageListMan = [NSMutableArray array];
    for (NSInteger i = 1; i < 3; i++) {
        NSString *imagePath = [NSString stringWithFormat:@"cloudman%02d.png", i];
        UIImage *img = [UIImage imageNamed:imagePath];
        [imageListMan addObject:img];
    }
    
    // アニメーション用画像をセット
    imageViewMan.animationImages = imageListMan;
    
    // アニメーションの速度
    imageViewMan.animationDuration = 1.0;
    
    // アニメーションのリピート回数
    imageViewMan.animationRepeatCount = 0;
    
    // アニメーション実行
    [imageViewMan startAnimating];
    
}
@end