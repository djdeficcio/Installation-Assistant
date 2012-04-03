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
#import "Sidebar.h"
#import "MaterialView.h"

@implementation SiteInformation

- (void)showSideMenu
{
    [self.view addSubview:[[Sidebar sharedInstance:self] getSidebarView]];
    [[Sidebar sharedInstance:self] showSidebarAnimation];
    [techTable setScrollEnabled:NO];
}

- (void)hideSideMenu
{
    [[Sidebar sharedInstance:self] hideSidebarAnimation];
    [techTable setScrollEnabled:YES];
}

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
    [self hideSideMenu];
    [super didReceiveMemoryWarning];
    NSLog(@"Memory Warning!");  
    
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
    
    
    UIColor *brushedMetal = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"brushedmetal.png"]];
    self.view.backgroundColor = brushedMetal;
    
    ProjectData *projectData = [ProjectData sharedInstance];
    
    dataPackage = [NSArray arrayWithArray:[projectData dataPackage]];
    
    DualColumnTable *dataTable = [[DualColumnTable alloc] initWithFrame:CGRectMake(50, 50, 668, 300) AndNumberOfRows:3 WithRowHeight:100];
    [dataTable populateCellsWithLabels:[projectData dataLabelPackage] AndValues:[projectData dataPackage]];
    
    [self.view addSubview:dataTable];
    
    techTable = [[DualColumnTable alloc] initWithFrame:CGRectMake(50, 400, 668, 460) AndNumberOfRows:8 WithRowHeight:100];
    [techTable populateCellsWithLabels:[projectData techLabelPackage] AndValues:[projectData techPackage]];
    
    [self.view addSubview:techTable];
    
    UISwipeGestureRecognizer *swipeTwoRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(showSideMenu)];
    
    swipeTwoRight.numberOfTouchesRequired = 2;
    swipeTwoRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeTwoRight];
    
    UISwipeGestureRecognizer *swipeTwoLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hideSideMenu)];
    
    swipeTwoLeft.numberOfTouchesRequired = 2;
    swipeTwoLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeTwoLeft];
    
}


- (void)viewWillDisappear:(BOOL)animated
{
    [self hideSideMenu];
    [super viewWillDisappear:animated];
    NSLog(@"View disappeared!");
    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
