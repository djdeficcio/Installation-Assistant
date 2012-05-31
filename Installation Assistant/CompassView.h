//
//  CompassView.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 1/4/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//
//  This view controller is meant to display a compass.  I can't seem to get
//  the stupid thing to read reliably though, so it's been pulled from the 1.0 version.
//  I've left this file in here in the hopes that either I, or someone smarter than me (possibly you?)
//  can someday get it working and implemented.

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface CompassView : UIViewController <CLLocationManagerDelegate>
{
    NSInteger targetDirection;
    CGFloat currentDirection;
    
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
}
@property (strong, nonatomic) IBOutlet UILabel *targetLabel;
@property (strong, nonatomic) IBOutlet UILabel *currentLabel;
@property (strong, nonatomic) IBOutlet UIImageView *compassImage;

- (IBAction)close:(id)sender;



@end
