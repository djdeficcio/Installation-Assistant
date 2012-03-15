//
//  HomeScreen.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 11/29/11.
//  Copyright (c) 2011 Solular, LLC. All rights reserved.
//

#import "HomeScreen.h"
#import "GlosslessButton.h"

@implementation HomeScreen


- (void)loadProjectSelection
{
    [self performSegueWithIdentifier:@"selectProjectSegue" sender:self];
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
    
    self.navigationItem.backBarButtonItem.title = @"Home";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    GlosslessButton *selectProjectButton = [[GlosslessButton alloc] initWithFrame:CGRectMake(200, 200, 200, 200)];
    [selectProjectButton addTarget:self action:@selector(loadProjectSelection) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:selectProjectButton];
    
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
