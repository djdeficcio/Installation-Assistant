//
//  ViewController.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 11/9/11.
//  Copyright (c) 2011 Solular, LLC. All rights reserved.
//


#import "ProjectSelection.h"
#import "MenuBar.h"
#import "GlosslessButton.h"
#import "Quartzcore/Quartzcore.h"
#import "Common.h"
#import "ProjectData.h"


@implementation ProjectSelection

- (void)loadProjectNames
{
    NSLog(@"Loading projects...");
    
    dispatch_sync(serverQueue, ^{
        NSData *data = [NSData dataWithContentsOfURL:requestProjects];
        
        if (data != NULL && data != nil) 
        {
            [self performSelectorOnMainThread:@selector(processProjectNames:) withObject:data waitUntilDone:YES];
        }
        
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Network Error" message:@"Failed to retrieve projects.  Do you have an internet connection?" delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
            [alert show];
        }
    });
}

- (void)processProjectNames:(NSData *)responseData {
    NSError* error;
    
    projects = nil;
    projects = [NSJSONSerialization JSONObjectWithData:responseData
                                                         options:kNilOptions
                                                 error:&error];
    
    NSLog(@"Project Total: %d", [projects count]);
    
    [projectTable reloadData];    

}

- (void)loadProjectData:(NSInteger)projectRow
{
    NSLog(@"Loading project data...");
    
    [[ProjectData sharedInstance] setProjectID:[[projects valueForKey:@"id"] objectAtIndex:projectRow]];
    
    dispatch_sync(serverQueue, ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://173.61.46.253/ios/retrieveProjectData.php?id=%@", [[ProjectData sharedInstance] projectID]]]];
        //NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://10.1.10.190/ios/retrieveProjectData.php?id=%@", [[projects valueForKey:@"id"] objectAtIndex:projectRow]]]];
        
        if (data != NULL && data != nil) 
        {
            [self performSelectorOnMainThread:@selector(processProjectData:) withObject:data waitUntilDone:YES];
        }
        
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Network Error" message:@"Failed to retrieve project data.  Do you have an internet connection?" delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
            [alert show];
        }
    });
}

- (void)processProjectData:(NSData *)responseData
{
    ProjectData *projectData = [ProjectData sharedInstance];
    
    NSError* error;
    
    NSMutableArray *jsonResult = [[NSMutableArray alloc] init];
    jsonResult = [NSJSONSerialization JSONObjectWithData:responseData
                                               options:kNilOptions
                                                 error:&error];
    
    
    
    NSLog(@"Project Data: %@", jsonResult);
    
    [projectData setProjectName:[jsonResult valueForKey:@"name"]];
    [projectData setPrimaryContact:[jsonResult valueForKey:@"contact"]];
    [projectData setSiteAddress:[jsonResult valueForKey:@"siteAddress"]];
    [projectData setSiteState:[jsonResult valueForKey:@"state"]];
    [projectData setContactPhoneNumber:[jsonResult valueForKey:@"phoneNumber"]];
    [projectData setUtilityCompany:[jsonResult valueForKey:@"utilityCompany"]];
    [projectData setTownship:[jsonResult valueForKey:@"township"]];
    [projectData setTownshipPhoneNumber:[jsonResult valueForKey:@"townshipPhoneNumber"]];
    [projectData setPanelType:[jsonResult valueForKey:@"panelType"]];
    [projectData setPanelQuantity:[jsonResult valueForKey:@"panelQuantity"]];
    [projectData setInverterType1:[jsonResult valueForKey:@"inverterType1"]];
    [projectData setInverterQuantity1:[jsonResult valueForKey:@"inverterQuantity1"]];
    [projectData setInverterType2:[jsonResult valueForKey:@"inverterType2"]];
    [projectData setInverterQuantity2:[jsonResult valueForKey:@"inverterQuantity2"]];
    [projectData setInverterType3:[jsonResult valueForKey:@"inverterType3"]];
    [projectData setInverterQuantity3:[jsonResult valueForKey:@"inverterQuantity3"]];
    [projectData setInverterType4:[jsonResult valueForKey:@"inverterType4"]];
    [projectData setInverterQuantity4:[jsonResult valueForKey:@"inverterQuantity4"]];
    [projectData setInverterType5:[jsonResult valueForKey:@"inverterType5"]];
    [projectData setInverterQuantity5:[jsonResult valueForKey:@"inverterQuantity5"]];
    [projectData setAzimuth:[jsonResult valueForKey:@"azimuth"]];
    [projectData setTilt:[jsonResult valueForKey:@"tilt"]];
    [projectData setRackingType:[jsonResult valueForKey:@"rackingType"]];
    if ([[jsonResult valueForKey:@"monitoring_system"] isEqualToString:@"0"]) {
        [projectData setMonitoringSystem:@"No"];
    }    
    else {
        [projectData setMonitoringSystem:@"Yes"];
    }
    [projectData setProjectManager:[jsonResult valueForKey:@"projectManager"]];
    
    [projectData packageData];
    
    if (jsonResult != nil)
    {
        [self performSegueWithIdentifier:@"mainScreenSegue" sender:self];
    }
    
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Network Error" message:@"Failed to retrieve projects.  Do you have an internet connection?" delegate:self cancelButtonTitle:@"Close" otherButtonTitles: nil];
        [alert show];
    }

}

#pragma mark - Table Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [projects count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"Cell %i", indexPath.section]];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:[NSString stringWithFormat:@"Cell %i", indexPath.section]];
    }
    
    cell.textLabel.text = [[projects valueForKey:@"name"] objectAtIndex:indexPath.row];
    [cells addObject:cell];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSLog(@"Project: %@ \nProject ID: %@", [[projects valueForKey:@"name"] objectAtIndex:indexPath.row], [[projects valueForKey:@"id"] objectAtIndex:indexPath.row]);
    
    [self loadProjectData:indexPath.row];
}

#pragma mark - View lifecycle
/*
- (void)loadView
{
}*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Select a Project";
    self.navigationItem.backBarButtonItem.title = @"Projects";

    
    UIBarButtonItem *refresh = [[UIBarButtonItem alloc] initWithTitle:@"Refresh" style:UIBarButtonItemStyleBordered target:self action:@selector(loadProjectNames)];
    self.navigationItem.rightBarButtonItem = refresh;
    
    UIColor *brushedMetal = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"brushedmetal.png"]];
    self.view.backgroundColor = brushedMetal;
    
    //Initialize arrays
    projects = [[NSMutableArray alloc] init];    
    cells = [[NSMutableArray alloc] init];
    
    //Create a synchronous call to retrieve the list of projects
    [self loadProjectNames];
    
    //Create and populate a table with that list of projects
    projectTable = [[UITableView alloc] initWithFrame:CGRectMake(50, 70, 668, 820) style:UITableViewStylePlain];
    
    projectTable.backgroundColor = [UIColor whiteColor];
    projectTable.layer.cornerRadius = 10;
    projectTable.layer.borderColor = [UIColor blackColor].CGColor;
    projectTable.layer.borderWidth = 1;
    projectTable.rowHeight = 80;
    
    projectTable.delegate = self;
    projectTable.dataSource = self;
    
    [self.view addSubview:projectTable];
    
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
