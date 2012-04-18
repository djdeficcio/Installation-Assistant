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
#import "TaskListTable.h"
#import "Quartzcore/Quartzcore.h"
#import "RoundedUIView.h"

@implementation SiteLocation
@synthesize materialList = _materialList;
@synthesize TaskList = _taskTable;
@synthesize crewListTable;
@synthesize currentLocationLabel;
@synthesize currentLocationView;
@synthesize dateLabel;

#pragma mark -
#pragma mark Custom Methods

- (void)refreshLocation
{
    self.currentLocationView.backgroundColor = [UIColor colorWithRed:134.0/255.0 green:212.0/255.0 blue:253.0/255.0 alpha:1.0];
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.currentLocationView.backgroundColor = [UIColor whiteColor];
                     }];
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
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)materialSelectController:(MaterialSelect *)controller updatedWithMaterials:(NSMutableArray *)materials
{
    _materialList = materials;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:1];
    [[self.TaskList cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
    [self.TaskList setNeedsDisplay];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark Crew Leader Select Delegate Methods

- (void)crewLeaderControllerDidSave:(CrewLeader *)controller
{
    [self.crewListTable reloadData];
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
    
    if ([segue.identifier isEqualToString:@"SelectCrewLeader"]) {
        CrewLeader *crewLeaderController = segue.destinationViewController;
        
        crewLeaderController.delegate = self;
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
        self.currentLocationLabel.text = [NSString stringWithFormat:@"%@ \n%@",[[placemark.addressDictionary objectForKey:@"FormattedAddressLines"] objectAtIndex:0], [[placemark.addressDictionary objectForKey:@"FormattedAddressLines"] objectAtIndex:1]];
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
    if (tableView.tag == CREWMEMBERS) {
        return 2;
    }
    
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (tableView.tag == CREWMEMBERS) {
        if (section == 0) {
            return @"Crew Leader";
        }
        
        else {
            return @"Crew Members";
        }
    }
    
    if (tableView.tag == TASKS) {
        return @"Tasks";
    }
    
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == CREWMEMBERS) {
        if (section == 0) {
            return 1;
        }
        
        else {
            if ([[[CrewMemberData sharedInstance] crewMembers] count] > 0) {
                return [[[CrewMemberData sharedInstance] crewMembers] count];
            }
            
            else {
                return 1;
            }
        }
    }
    
    if (tableView.tag == TASKS) {
        return [taskList count];
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
        
        if (indexPath.section == 0) {
            cell.textLabel.text = [[CrewMemberData sharedInstance] crewLeaderName];
        }
        
        else {
            if ([[[CrewMemberData sharedInstance] crewMembers] count] > 0) {
                cell.textLabel.text = [[[[CrewMemberData sharedInstance] crewMembers] objectAtIndex:indexPath.row] objectForKey:@"member_name"];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            
            else {
                cell.textLabel.text = @"No Crew Members Selected";
            }
        }
    }
    
    if (tableView.tag == TASKS) {
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:[NSString stringWithFormat:@"Cell %i", indexPath.section]];
        }
        
        cell.textLabel.text = [taskList objectAtIndex:indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        
        
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (tableView.tag == CREWMEMBERS) {
        if (indexPath.section == 0) {
            [self performSegueWithIdentifier:@"SelectCrewLeader" sender:self];
        }
        
        else {
            [self performSegueWithIdentifier:@"SelectCrewMembers" sender:self];
        }
    }
    
    if (tableView.tag == TASKS) {
        switch (indexPath.row) {
            case 0:
                [self performSegueWithIdentifier:@"ViewMaterials" sender:self];
                break;
                
            default:
                break;
        }
    }
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        
         taskList = [[NSMutableArray alloc] initWithArray:[NSArray arrayWithObjects:@"Materials", @"Completed", @"Manager Update", @"Weather", @"Temperature", @"Client Updated", nil]];
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
    
    self.TaskList.layer.cornerRadius = 10;
    self.TaskList.layer.borderColor = [UIColor blackColor].CGColor;
    self.TaskList.layer.borderWidth = 1;
    
    self.crewListTable.layer.cornerRadius = 10;
    self.crewListTable.layer.borderColor = [UIColor blackColor].CGColor;
    self.crewListTable.layer.borderWidth = 1;
    
    UITapGestureRecognizer *refreshLocation = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(refreshLocation)];
    [self.currentLocationView addGestureRecognizer:refreshLocation];

    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterLongStyle;
    
    NSString *todaysDate = [dateFormatter stringFromDate:date];
    
    self.dateLabel.text = todaysDate;
    
    [locationManager startUpdatingLocation];
}


- (void)viewDidUnload
{
    [self setTaskList:nil];
    [self setCurrentLocationLabel:nil];
    [self setCurrentLocationView:nil];
    [self setDateLabel:nil];
    [self setCrewListTable:nil];
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
