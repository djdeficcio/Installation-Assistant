//
//  LocationView.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 3/19/12.
//  Copyright 2012 Solular, LLC. All rights reserved.
//	File created using Singleton XCode Template by Mugunth Kumar (http://blog.mugunthkumar.com)
//  More information about this template on the post http://mk.sg/89	
//  Permission granted to do anything, commercial/non-commercial with this file apart from removing the line/URL above

#import "LocationView.h"
#import "LocationServicesView.h"

static LocationView *_instance;
@implementation LocationView


#pragma mark -
#pragma mark Custom Methods

- (void)hideLocationView {
    [locationManager stopUpdatingLocation];
    [mainView removeFromSuperview];
}

- (UIView *)getLocationView {
    [locationManager startUpdatingLocation];
    return mainView;
}



#pragma mark -
#pragma mark CLLocation Delegate Methods
- (BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager
{
    //return YES;
    return NO;
}


- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"Coords: %@", newLocation);
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *placemark = [placemarks objectAtIndex:0];
        mainView.location.text = [NSString stringWithFormat:@"%@ \n%@",[[placemark.addressDictionary objectForKey:@"FormattedAddressLines"] objectAtIndex:0], [[placemark.addressDictionary objectForKey:@"FormattedAddressLines"] objectAtIndex:1]];
    }];
    [locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    
}

#pragma mark -
#pragma mark Singleton Methods

- (id)init {
    self = [super init];
    if (self) {
        mainView = [[LocationServicesView alloc] initWithFrame:CGRectMake(168, 50, 550, 760)];
        
        [self.view addSubview:mainView];
        
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    }
    
    return self;
}

+ (LocationView *)sharedInstance
{
    if (_instance == nil) {
        
        _instance = [[super allocWithZone:NULL] init];
        
    }

    return _instance;
}

+ (id)allocWithZone:(NSZone *)zone

{
    return _instance; //on subsequent allocation attempts return nil	
}


- (id)copyWithZone:(NSZone *)zone
{
    return self;	
}


@end
