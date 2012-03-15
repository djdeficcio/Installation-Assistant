//
//  CompassView.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 1/4/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "CompassView.h"
#import "Quartzcore/Quartzcore.h"

static CompassView *_instance;
@implementation CompassView 

#pragma mark -
#pragma mark Singleton Methods

+ (CompassView *)sharedInstance
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

- (void)hideCompassView
{
    [locationManager stopUpdatingHeading];
    [compassView removeFromSuperview];
}

- (UIView *)getCompassView
{
    [locationManager startUpdatingHeading];
    return compassView;
}

- (id)init
{
    self = [super init];
    if (self) {
        
        compassView = [[UIView alloc] initWithFrame:CGRectMake(168, 50, 500, 500)];
        compassView.backgroundColor = [UIColor whiteColor];
        compassView.layer.borderColor = [UIColor blackColor].CGColor;
        compassView.layer.borderWidth = 1;
        compassView.layer.masksToBounds = YES;
        compassView.layer.cornerRadius = 10;
        
        
        
        
        targetDirectionView = [[UIView alloc] initWithFrame:CGRectMake(11, 11, 120, 80)];
        targetDirectionView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
        targetDirectionView.layer.cornerRadius = 10;
        targetDirectionView.layer.borderColor = [UIColor grayColor].CGColor;
        targetDirectionView.layer.borderWidth = 3;
        
        targetDirectionLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 110, 70)];
        targetDirectionLabel.backgroundColor = [UIColor clearColor];
        targetDirectionLabel.text = @"360*";
        targetDirectionLabel.textAlignment = UITextAlignmentCenter;
        targetDirectionLabel.font = [UIFont boldSystemFontOfSize:34];
        targetDirectionLabel.textColor = [UIColor whiteColor];
        
        [targetDirectionView addSubview:targetDirectionLabel];
        [compassView addSubview:targetDirectionView];
        
        currentDirectionView = [[UIView alloc] initWithFrame:CGRectMake(compassView.frame.size.width - 130, 10, 120, 80)];
        currentDirectionView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
        currentDirectionView.layer.cornerRadius = 10;
        currentDirectionView.layer.borderColor = [UIColor grayColor].CGColor;
        currentDirectionView.layer.borderWidth = 3;
        
        currentDirectionLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 110, 70)];
        currentDirectionLabel.backgroundColor = [UIColor clearColor];
        currentDirectionLabel.text = @"270*";
        currentDirectionLabel.textAlignment = UITextAlignmentCenter;
        currentDirectionLabel.font = [UIFont boldSystemFontOfSize:34];
        currentDirectionLabel.textColor = [UIColor whiteColor];
        
        [currentDirectionView addSubview:currentDirectionLabel];
        [compassView addSubview:currentDirectionView];
        
        [self.view addSubview:compassView];
        
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        NSLog(@"Compass Initialized");
    }
    return self;
}

- (void)loadView
{
    NSLog(@"Compass loadView");
}

- (void)viewDidLoad
{
    NSLog(@"Compass viewDidLoad");
}

//Core location delegate methods
- (BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager
{
    //return YES;
    return NO;
}


- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    if ([CLLocationManager headingAvailable])
    {
        NSLog(@"We have a heading!");
    }
    NSLog(@"%@", newHeading);
    currentDirectionLabel.text = [NSString stringWithFormat:@"%f", newHeading.trueHeading];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    
    
    
}*/


@end
