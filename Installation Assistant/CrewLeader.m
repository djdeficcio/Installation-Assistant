//
//  CrewLeader.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 3/29/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "CrewLeader.h"
#import "CrewMemberData.h"
#import "DBGateway.h"
#import "ProjectData.h"
#import "Quartzcore/Quartzcore.h"

@implementation CrewLeader
@synthesize crewLeaderList, delegate;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionHeader;
    
    switch (section) {
        case 0:
            sectionHeader = [NSString stringWithFormat:@"Crew Leaders:"];
            break;
            
        case 1:
            sectionHeader = [NSString stringWithFormat:@"Crew Members:"];
            break;
            
        default:
            break;
    }
    
    return sectionHeader;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [crewLeaders count];
    }
    
    else {
        return [crewMembers count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"Cell %i", indexPath.section]];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:[NSString stringWithFormat:@"Cell %i", indexPath.section]];
    }
    
    if (indexPath.section == 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@, %@", [[crewLeaders objectAtIndex:indexPath.row] objectForKey:@"last_name"], [[crewLeaders objectAtIndex:indexPath.row] objectForKey:@"first_name"]];
    }
    
    else if (indexPath.section == 1) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@, %@", [[crewMembers objectAtIndex:indexPath.row] objectForKey:@"last_name"], [[crewMembers objectAtIndex:indexPath.row] objectForKey:@"first_name"]];

    }
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        selectedLeader = [crewLeaders objectAtIndex:indexPath.row];
    }
    
    else if (indexPath.section == 1) {
        selectedLeader = [crewMembers objectAtIndex:indexPath.row];
    }
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(id)sender {
    if ([selectedLeader count] > 0) {
        [[CrewMemberData sharedInstance] setCrewLeaderWithFirstName:[selectedLeader objectForKey:@"first_name"] LastName:[selectedLeader objectForKey:@"last_name"] AndId:[selectedLeader objectForKey:@"member_id"]];
    }
    [self.delegate crewLeaderControllerDidSave:self];
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        crewLeaders = [[NSMutableArray alloc] init];
        crewMembers = [[NSMutableArray alloc] init];
        selectedLeader = [[NSMutableDictionary alloc] init];
        
        DBGateway *gateway = [[DBGateway alloc] init];
        
        crewLeaders = [gateway getCrewLeadersForState:[[ProjectData sharedInstance] siteState]];
        crewMembers = [gateway getCrewMembersForState:[[ProjectData sharedInstance] siteState]];
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setCrewLeaderList:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
