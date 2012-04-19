//
//  SiteLocation.m
//  Installation Assistant
//
//  Created by Solular on 4/10/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "SiteLocation.h"
#import "CrewLeader.h"
#import "CrewMembers.h"
#import "CrewMemberData.h"
#import "MaterialList.h"
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

- (void)updateTableCellAccessoryAtRow:(NSInteger)row inSection:(NSInteger)section
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    [[self.TaskList cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
}

- (void)updateTableCellAccessoryAtRow:(NSInteger)row inSection:(NSInteger)section withDetail:(NSString *)detail
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    UITableViewCell *cell = [self.TaskList cellForRowAtIndexPath:indexPath];
    [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    
    if (detail) {
        cell.detailTextLabel.text = detail;
    }
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
    
    NSString *countText;
    
    if ([_materialList count] == 1) {
        countText = [NSString stringWithFormat:@"1 Item"];
    }
    
    else {
        countText = [NSString stringWithFormat:@"%i Items", [_materialList count]];
    }
    
    [self updateTableCellAccessoryAtRow:0 inSection:0 withDetail:countText];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark Crew Leader Select Delegate Methods

- (void)crewLeaderControllerDidSave:(CrewLeader *)controller
{
    [self.crewListTable reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark Crew Member Select Delegate Methods

- (void)crewMembersControllerDidCancel:(CrewMembers *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)crewMembersControllerDidSave:(CrewMembers *)controller
{
    [self.crewListTable reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark Completed Percentage Delegate Methods

- (void)completedPercentageController:(CompletedPercentage *)controller updatedWithValue:(NSString *)percentage
{
    completionPercentage = percentage;
    [self updateTableCellAccessoryAtRow:1 inSection:0 withDetail:[NSString stringWithFormat:@"%@", completionPercentage]];
    [popoverController dismissPopoverAnimated:YES];
    popoverController = nil;
    
}

#pragma mark -
#pragma mark Manager Update Delegate Methods

- (void)managerUpdateControllerDidCancel:(ManagerUpdate *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)managerUpdateController:(ManagerUpdate *)controller didSaveMessage:(NSString *)message
{
    managerUpdateMessage = message;
    [self dismissViewControllerAnimated:YES completion:nil];
    [self updateTableCellAccessoryAtRow:2 inSection:0];
}

#pragma mark - 
#pragma mark Weather Select Delegate Methods

- (void)weatherSelectController:(WeatherSelect *)controller didSelectWeather:(NSString *)weather
{
    selectedWeather = weather;
    [self updateTableCellAccessoryAtRow:3 inSection:0 withDetail:selectedWeather];
    [popoverController dismissPopoverAnimated:YES];
    popoverController = nil;
}

#pragma mark -
#pragma mark CLLocation Delegate Methods
- (BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager
{
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
    NSLog(@"Location Manager Error: %@", error);
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
                
            case 1:
                completedPercentageController = [[CompletedPercentage alloc] initWithStyle:UITableViewStylePlain];
                completedPercentageController.delegate = self;
                popoverController = [[UIPopoverController alloc] initWithContentViewController:completedPercentageController];
                popoverController.popoverContentSize = CGSizeMake(100, 480);
                [popoverController presentPopoverFromRect:[tableView rectForRowAtIndexPath:indexPath] inView:tableView permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
                break;
                
            case 2:
                [self performSegueWithIdentifier:@"UpdateManager" sender:self];
                break;
                
            case 3:
                weatherSelectController = [[WeatherSelect alloc] initWithStyle:UITableViewStylePlain];
                weatherSelectController.delegate = self;
                popoverController = [[UIPopoverController alloc] initWithContentViewController:weatherSelectController];
                popoverController.popoverContentSize = CGSizeMake(150, 264);
                [popoverController presentPopoverFromRect:[tableView rectForRowAtIndexPath:indexPath] inView:tableView permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
                break;
                
            default:
                break;
        }
    }
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
    
    if ([segue.identifier isEqualToString:@"SelectCrewMembers"]) {
        CrewMembers *crewMembersController = segue.destinationViewController;
        crewMembersController.delegate = self;
    }
    
    if ([segue.identifier isEqualToString:@"UpdateManager"]) {
        ManagerUpdate *managerUpdateController = segue.destinationViewController;
        managerUpdateController.delegate = self;
        managerUpdateController.updateTextView.text = managerUpdateMessage;
    }
    
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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
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
