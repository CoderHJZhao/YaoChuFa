//
//  CFCurrentLocation.m
//  ToStartTravelAround
//
//  Created by mac on 15/8/2.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "CFCurrentLocation.h"

@interface CFCurrentLocation () <CLLocationManagerDelegate>
@property(nonatomic,strong)CLLocationManager *locationManager;
@end

@implementation CFCurrentLocation
- (CLLocationManager *)locationManager
{
    if (!_locationManager) {
        _locationManager = [CLLocationManager new];
    }
    return _locationManager;
}
- (CLLocation *)currentLocation
{
    NSLog(@"%@",_currentLocation);
    return _currentLocation;
}

- (instancetype)init
{
    if (self = [super init]) {
        //判断设备系统版本
        if (DeviceVersion >=8.0) {
            //申请定位权限
            [self.locationManager requestWhenInUseAuthorization];
            
        }
        //开始监测用户位置
        [self.locationManager startUpdatingLocation];
        self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
        self.locationManager.delegate = self;

    }
    return self;
}
#pragma mark- CLLocationManagerDelegate
//定位成功，返回位置信息
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
    CLLocation *location = locations[0];
    
    self.currentLocation = location;

    
}
//定位失败
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
    NSLog(@"定位失败");
    
}




@end
