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
    
    ProjectData *projectData = [ProjectData sharedInstance];
    
    dataPackage = [NSArray arrayWithArray:[projectData dataPackage]];
    
    DualColumnTable *dataTable = [[DualColumnTable alloc] initWithFrame:CGRectMake(50, 50, 668, 300) AndNumberOfRows:3 WithRowHeight:100];
    [dataTable populateCellsWithLabels:[projectData dataLabelPackage] AndValues:[projectData dataPackage]];
    
    [self.view addSubview:dataTable];
    
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
