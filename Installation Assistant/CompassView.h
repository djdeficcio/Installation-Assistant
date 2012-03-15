//
//  CompassView.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 1/4/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface CompassView : UIViewController <CLLocationManagerDelegate>
{
    UIView *compassView;
    UIView *targetDirectionView;
    UIView *currentDirectionView;
    UILabel *targetDirectionLabel;
    UILabel *currentDirectionLabel;
    NSInteger targetDirection;
    NSInteger currentDirection;
    
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
}

+ (CompassView *)sharedInstance;

- (UIView *)getCompassView;
- (void)hideCompassView;



@end
