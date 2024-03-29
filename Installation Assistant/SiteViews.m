//
//  SiteViews.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 12/1/11.
//  Copyright (c) 2011 Solular, LLC. All rights reserved.
//

#import "SiteViews.h"
#import "Quartzcore/Quartzcore.h"

@implementation SiteViews

// Loads the overhead map of the user's current location in a webview. This is pretty much
// everything that this controller does.
- (void)displayCurrentLocation
{
    
    NSString *url = @"http://173.61.254.66/ios/googleView.html";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [googleView loadRequest:request];
    
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


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIColor *background = [UIColor colorWithPatternImage:[UIImage imageNamed:@"brushedmetal.png"]];
    self.view.backgroundColor = background;
    
    // Creates a refresh button
    UIBarButtonItem *refresh = [[UIBarButtonItem alloc] initWithTitle:@"Refresh" style:UIBarButtonItemStyleBordered target:self action:@selector(displayCurrentLocation)];
    self.navigationItem.rightBarButtonItem = refresh;
    
    
    
    
    googleView.backgroundColor = [UIColor clearColor];
    
    [self displayCurrentLocation];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
