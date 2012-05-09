//
//  CompassView.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 1/4/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "CompassView.h"
#import "Quartzcore/Quartzcore.h"
#import "ProjectData.h"

@implementation CompassView 
@synthesize targetLabel;
@synthesize currentLabel;
@synthesize compassImage;

- (void)hideCompassView
{
}

- (IBAction)close:(id)sender {    
    [locationManager stopUpdatingHeading];
    [self dismissModalViewControllerAnimated:YES];
}


#pragma mark - Location Manager Delegate Methods
- (BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager
{
    return YES;
    //return NO;
}


- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    NSLog(@"Heading: %@", newHeading);
    self.currentLabel.text = [NSString stringWithFormat:@"%f", newHeading.trueHeading];
    CGFloat imageRotation = currentDirection - newHeading.magneticHeading;
    currentDirection = newHeading.magneticHeading;
    [UIView animateWithDuration:0.1 animations:^{
        self.compassImage.transform = CGAffineTransformMakeRotation(imageRotation);
    }];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
                
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.headingOrientation = CLDeviceOrientationPortrait;
        locationManager.headingFilter = kCLHeadingFilterNone;
        currentDirection = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    self.targetLabel.text = [[ProjectData sharedInstance] azimuth];
    [locationManager startUpdatingHeading];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    
    
    
}*/


- (void)viewDidUnload {
    [self setTargetLabel:nil];
    [self setCurrentLabel:nil];
    [self setCompassImage:nil];
    [super viewDidUnload];
}
@end
