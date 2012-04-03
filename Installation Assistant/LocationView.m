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
#import "DBGateway.h"
#import "CrewLeader.h"
#import "CrewMembers.h"
#import "CrewMemberData.h"

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

- (void)refreshLocation
{
    [mainView refreshLocationAnimation];
    [locationManager startUpdatingLocation];
}

- (void)selectCrewLeader
{
    [mainView selectCrewLeaderAnimation];
    CrewLeader *crewLeaderController = [[CrewLeader alloc] initWithNibName:nil bundle:nil andControllerToUpdate:self];
    [mainView addSubview:crewLeaderController.view];
    [crewLeaderController presentSelf];
}

- (void)updateCrewLeaderView
{
    NSLog(@"%@", [[CrewMemberData sharedInstance] crewLeaderName]);
    [mainView.crewLeader setText:[[CrewMemberData sharedInstance] crewLeaderName]];
}

- (void)selectCrewMembers 
{
    [mainView selectCrewMemberAnimation];
    CrewMembers *crewMembersController = [[CrewMembers alloc] initWithNibName:nil bundle:nil andControllerToUpdate:self];
    [mainView addSubview:crewMembersController.view];
    [crewMembersController presentSelf];
}

- (void)updateCrewMemberView
{
    [mainView.crewMemberList reloadData];
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
#pragma mark Table Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[CrewMemberData sharedInstance] crewMembers] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"Cell %i", indexPath.section]];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:[NSString stringWithFormat:@"Cell %i", indexPath.section]];
    }
    
    cell.textLabel.text = [[[[CrewMemberData sharedInstance] crewMembers] objectAtIndex:indexPath.row] objectForKey:@"member_name"];
    
    return cell;
}

#pragma mark -
#pragma mark Singleton Methods

- (id)init {
    self = [super init];
    if (self) {
        mainView = [[LocationServicesView alloc] initWithFrame:CGRectMake(168, 50, 550, 760) andParentController:self];
        
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
