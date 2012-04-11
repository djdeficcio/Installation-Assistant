//
//  CrewLeader.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 3/29/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "CrewLeader.h"
#import "CrewLeaderView.h"
#import "SiteLocation.h"
#import "CrewMemberData.h"
#import "DBGateway.h"
#import "ProjectData.h"

@implementation CrewLeader

- (void)presentSelf
{
    [mainView animateEntrance];
}

- (void)removeSelf
{
    [controllerToUpdate updateCrewLeaderView];
    [mainView animateExit];
}

- (void)confirmSelection
{
    if ([selectedLeader count] > 0) {
        [[CrewMemberData sharedInstance] setCrewLeaderWithFirstName:[selectedLeader objectForKey:@"first_name"] LastName:[selectedLeader objectForKey:@"last_name"] AndId:[selectedLeader objectForKey:@"member_id"]];
    }
    [self removeSelf];
}

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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andControllerToUpdate:(SiteLocation *)controller
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        controllerToUpdate = controller;
        
        crewLeaders = [[NSMutableArray alloc] init];
        crewMembers = [[NSMutableArray alloc] init];
        selectedLeader = [[NSMutableDictionary alloc] init];
        
        DBGateway *gateway = [[DBGateway alloc] init];
        
        crewLeaders = [gateway getCrewLeadersForState:[[ProjectData sharedInstance] siteState]];
        crewMembers = [gateway getCrewMembersForState:[[ProjectData sharedInstance] siteState]];
        
        NSLog(@"%@", crewLeaders);
        
        
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        mainView = [[CrewLeaderView alloc] initWithFrame:CGRectMake(0, -20, screenBounds.size.width, screenBounds.size.height) andParentController:self];
        [self.view addSubview:mainView];
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
