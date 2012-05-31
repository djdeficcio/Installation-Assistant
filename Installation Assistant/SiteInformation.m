//
//  SiteInformation.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 12/1/11.
//  Copyright (c) 2011 Solular, LLC. All rights reserved.
//

#import "SiteInformation.h"
#import "ProjectData.h"
#import "DualColumnTable.h"

@implementation SiteInformation

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    
    // Saves the ProjectData singleton as a local variable.  Some tutorials told me to do this, but I'm not convinced
    // that it's necessary.
    ProjectData *projectData = [ProjectData sharedInstance];
    
    // Creating an array of the information displayed in the top dual column view. 
    // This includes the contact person, their phone number, the site address, utility company, township, and township phone number.
    dataPackage = [NSArray arrayWithArray:[projectData dataPackage]];
    
    // Creating the table and populating it.
    DualColumnTable *dataTable = [[DualColumnTable alloc] initWithFrame:CGRectMake(50, 50, 668, 300) AndNumberOfRows:3 WithRowHeight:100];
    [dataTable populateCellsWithLabels:[projectData dataLabelPackage] AndValues:[projectData dataPackage]];
    
    [self.view addSubview:dataTable];
    
    // Creating the bottom table and populating it.
    techTable = [[DualColumnTable alloc] initWithFrame:CGRectMake(50, 400, 668, 460) AndNumberOfRows:8 WithRowHeight:100];
    [techTable populateCellsWithLabels:[projectData techLabelPackage] AndValues:[projectData techPackage]];
    
    [self.view addSubview:techTable];
    
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];  
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
