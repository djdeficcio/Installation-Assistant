//
//  AddMaterial.m
//  Installation Assistant
//
//  Created by Solular on 4/12/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "AddMaterial.h"

@implementation AddMaterial
@synthesize delegate;
@synthesize name;
@synthesize quantity;
@synthesize date;

- (IBAction)cancel:(id)sender
{
    [self.delegate addMaterialControllerDidCancel:self];
}

- (IBAction)save:(id)sender
{
    NSString *materialName = [name text];
    NSString *materialQuantity = [quantity text];
    NSDate *materialDate = [date date];
    
    [self.delegate addMaterialController:self didAddMaterial:materialName withQuantity:materialQuantity forDate:materialDate];
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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [self setName:nil];
    [self setQuantity:nil];
    [self setDate:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
