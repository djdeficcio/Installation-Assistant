//
//  CrewMembers.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 4/2/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "CrewMembers.h"
#import "DBGateway.h"
#import "ProjectData.h"
#import "CrewMemberData.h"

@implementation CrewMembers
@synthesize delegate;

- (void)confirmSelection
{
    [[CrewMemberData sharedInstance] resetCrewMembers];
    
    
    if ([selectedFieldCrew count] > 0) {
        NSArray *fieldCrewValues = [selectedFieldCrew allValues];
        
        
        for (int i=0;i<[fieldCrewValues count];i++) {
            [[CrewMemberData sharedInstance] setCrewMemberWithFirstName:[[fieldCrewValues objectAtIndex:i] objectForKey:@"first_name"] LastName:[[fieldCrewValues objectAtIndex:i] objectForKey:@"last_name"] AndId:[[fieldCrewValues objectAtIndex:i] objectForKey:@"member_id"]];
        }
    }
    NSLog(@"Selected: %@", [[CrewMemberData sharedInstance] crewMembers]);
}

#pragma mark -
#pragma mark - Table Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [fieldCrew count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"Cell %i", indexPath.section]];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:[NSString stringWithFormat:@"Cell %i", indexPath.section]];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@, %@", [[fieldCrew objectAtIndex:indexPath.row] objectForKey:@"last_name"], [[fieldCrew objectAtIndex:indexPath.row] objectForKey:@"first_name"]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [selectedFieldCrew setObject:[fieldCrew objectAtIndex:indexPath.row] forKey:[NSString stringWithFormat:@"%i", indexPath.row]];
    NSLog(@"%@", selectedFieldCrew);
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [selectedFieldCrew removeObjectForKey:[NSString stringWithFormat:@"%i", indexPath.row]];
    NSLog(@"%@", selectedFieldCrew);
}

- (IBAction)cancel:(id)sender {
    [self.delegate crewMembersControllerDidCancel:self];
}

- (IBAction)save:(id)sender {
    [self confirmSelection];
    [self.delegate crewMembersControllerDidSave:self];
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        DBGateway *gateway = [[DBGateway alloc] init];
        
        fieldCrew = [gateway getAllFieldCrewForState:[[ProjectData sharedInstance] siteState]];
        selectedFieldCrew = [[NSMutableDictionary alloc] init];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
