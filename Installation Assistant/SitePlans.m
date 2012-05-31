//
//  SitePlans.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 12/1/11.
//  Copyright (c) 2011 Solular, LLC. All rights reserved.
//

#import "SitePlans.h"
#import "ProjectData.h"
#import "DBGateway.h"

@implementation SitePlans
@synthesize planSelector;
@synthesize mainView;
@synthesize s1View;
@synthesize e1View;

- (IBAction)changePlanView:(id)sender {
    UISegmentedControl *control = (UISegmentedControl *)sender;
    
    if (control.selectedSegmentIndex == 0) {
        [self showS1View];
    }
    
    if (control.selectedSegmentIndex == 1) {
        [self showE1View];
    }
}

// Handles showing and hiding the segmented control used for selecting plans.
- (void)showOrHideMenu
{
    if (self.planSelector.hidden == YES) {
        [UIView animateWithDuration:0.3 animations:^{
            self.planSelector.hidden = NO;
            self.planSelector.alpha = 1;
        }];
    }
    
    else if (self.planSelector.hidden == NO) {        
        [UIView animateWithDuration:0.3 delay:0.3 options:kNilOptions animations:^{
            self.planSelector.alpha = 0;
        }completion:^(BOOL finished){
            self.planSelector.hidden = YES;
        }];
    }
}

// Shows the S1 plan, and hides the E1.
- (void)showS1View
{
    [self.s1View setHidden:NO];
    [self.e1View setHidden:YES];
}

// Shows the E1 plan, and hides the S1.
- (void)showE1View
{
    [self.e1View setHidden:NO];
    [self.s1View setHidden:YES];
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

- (void)testMethod
{
    NSLog(@"Successful test");  
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Add the gesture recognizor that shows/hides the segmented control.
    UITapGestureRecognizer *manageMenu = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showOrHideMenu)];
    [self.mainView addGestureRecognizer:manageMenu];
    
    // Populate our plan views.
    DBGateway *gateway = [[DBGateway alloc] init];
    NSURLRequest *s1Request = [gateway getProjectS1Request:[[ProjectData sharedInstance]projectID]];
    [self.s1View loadRequest:s1Request];
    
    NSURLRequest *e1Request = [gateway getProjectE1Request:[[ProjectData sharedInstance] projectID]];
    [self.e1View loadRequest:e1Request];
}


- (void)viewDidUnload
{
    [self setPlanSelector:nil];
    [self setMainView:nil];
    [self setS1View:nil];
    [self setE1View:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
    
    return NO;
}

@end
