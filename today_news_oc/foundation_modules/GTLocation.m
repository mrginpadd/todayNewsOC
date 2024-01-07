//
//  GTLocation.m
//  today_news_oc
//
//  Created by xushihao on 2024/1/6.
//

#import "GTLocation.h"
#import <CoreLocation/CoreLocation.h>

@interface GTLocation()<CLLocationManagerDelegate>
@property(nonatomic, strong, readwrite) CLLocationManager *manager;
@end

@implementation GTLocation

+(GTLocation  *)shared {
    static GTLocation *location;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        location = [[GTLocation alloc] init];
    });
    return location;
    
}

-(instancetype) init {
    self = [super init];
    if (self) {
        self.manager = [[CLLocationManager alloc] init];
        self.manager.delegate = self;
    }
    return self;
}

-(void) checkLocationAuthorization {
    //判断系统是否开启
    if(![CLLocationManager locationServicesEnabled]) {
        //引导弹窗
    }
    //主动请求 如果用户拒绝不会再探出，只能去设置里开启
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        [self.manager requestWhenInUseAuthorization];
    }
}
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.manager stopUpdatingLocation];
    } else if(status == kCLAuthorizationStatusDenied) {
        
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    NSLog(@"");
    CLLocation *location = [locations firstObject];
    CLGeocoder *coder = [[CLGeocoder alloc] init];
    
    [coder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
            //地标信息
    }];
    [self.manager stopUpdatingLocation];
}

@end
