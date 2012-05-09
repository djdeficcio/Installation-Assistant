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
