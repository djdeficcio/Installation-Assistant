//
//  SiteLocation.m
//  Installation Assistant
//
//  Created by Solular on 4/10/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "SiteLocation.h"
#import "SiteLocationView.h"
#import "CrewLeader.h"
#import "CrewMembers.h"
#import "CrewMemberData.h"
#import "MaterialList.h"

@implementation SiteLocation
@synthesize materialList = _materialList;

#pragma mark -
#pragma mark Custom Methods

- (void)refreshLocation
{
    [mainView refreshLocationAnimation];
    [locationManager startUpdatingLocation];
}

- (void)selectCrewLeader
{
    //[mainView selectCrewLeaderAnimation];
    CrewLeader *crewLeaderController = [[CrewLeader alloc] initWithNibName:nil bundle:nil andControllerToUpdate:self];
    [mainView addSubview:crewLeaderController.view];
    [crewLeaderController presentSelf];
}

- (void)updateCrewLeaderView
{
    [mainView.crewLeader setText:[[CrewMemberData sharedInstance] crewLeaderName]];
}

- (void)selectCrewMembers 
{
    //[mainView selectCrewMemberAnimation];
    CrewMembers *crewMembersController = [[CrewMembers alloc] initWithNibName:nil bundle:nil andControllerToUpdate:self];
    [mainView addSubview:crewMembersController.view];
    [crewMembersController presentSelf];
}

- (void)updateCrewMemberView
{
    [mainView.crewMemberList reloadData];
}

- (void)selectMaterials 
{
    [self performSegueWithIdentifier:@"ViewMaterials" sender:self];
}

- (void)updateMaterials
{
    
}

#pragma mark -
#pragma mark Material Select Delegate Methods

- (void)materialSelectControllerDidCancel:(MaterialSelect *)controller
{
    NSLog(@"Dismissing modal view");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)materialSelectController:(MaterialSelect *)controller updatedWithMaterials:(NSMutableArray *)materials
{
    _materialList = materials;
    [mainView.materialList reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ViewMaterials"])
    {
        UINavigationController *navigationController = segue.destinationViewController;
        
        MaterialSelect *materialSelectController = [[navigationController viewControllers] objectAtIndex:0];
        materialSelectController.delegate = self;
        materialSelectController.materials = _materialList;
    }
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
    if (tableView.tag == CREWMEMBERS) {
        return [[[CrewMemberData sharedInstance] crewMembers] count];
    }
    
    if (tableView.tag == MATERIALS) {
        return [_materialList count];
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"Cell %i", indexPath.section]];
    
    if (tableView.tag == CREWMEMBERS) {
    
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:[NSString stringWithFormat:@"Cell %i", indexPath.section]];
        }
        
        cell.textLabel.text = [[[[CrewMemberData sharedInstance] crewMembers] objectAtIndex:indexPath.row] objectForKey:@"member_name"];
    }
    
    if (tableView.tag == MATERIALS) {
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:[NSString stringWithFormat:@"Cell %i", indexPath.section]];
        }
        
        cell.textLabel.text = [[_materialList objectAtIndex:indexPath.row] objectForKey:@"name"];
        
    }
    
    return cell;
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    mainView = [[SiteLocationView alloc] initWithFrame:[[UIScreen mainScreen] bounds] andParentController:self];
    
    [self.view addSubview:mainView];
    
    [locationManager startUpdatingLocation];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
