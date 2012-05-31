//
//  SiteTabController.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 12/6/11.
//  Copyright (c) 2011 Solular, LLC. All rights reserved.
//

#import "SiteTabController.h"
#import "ProjectData.h"
#import "SiteInformation.h"
#import "SiteViews.h"
#import "SitePlans.h"
#import "LocationView.h"
#import "ToolsMenu.h"

@implementation SiteTabController
@synthesize toolsButton;

- (IBAction)showToolsMenu:(id)sender {
    ToolsMenu *toolsMenuController = [[ToolsMenu alloc] initWithStyle:UITableViewStylePlain];
    toolsMenuController.delegate = self;
    popoverController = [[UIPopoverController alloc] initWithContentViewController:toolsMenuController];    
    popoverController.popoverContentSize = CGSizeMake(150, 264);
    [popoverController setPopoverContentSize:CGSizeMake(200, 59)];
    [popoverController presentPopoverFromRect:CGRectMake(730, 0, toolsButton.width, 1) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}

// Performs a segue based on the option selected, and dismisses the popover.
- (void)toolsMenuToolSelected:(NSInteger)toolRow
{
    [popoverController dismissPopoverAnimated:YES];
    switch (toolRow) {
        case 0:
            [self performSegueWithIdentifier:@"NotesSegue" sender:self];
            break;
            
        default:
            break;
    }
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
    
    ProjectData *projectData = [ProjectData sharedInstance];
    
    self.navigationItem.title = [projectData projectName];
}


- (void)viewDidUnload
{
    [self setToolsButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return NO;
}

@end
