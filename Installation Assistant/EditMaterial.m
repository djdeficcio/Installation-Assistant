//
//  EditMaterial.m
//  Installation Assistant
//
//  Created by Solular on 4/12/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "EditMaterial.h"

@implementation EditMaterial
@synthesize name, quantity, date, delegate, selectedMaterial = _selectedMaterial;

#pragma mark - IB Actions
- (IBAction)cancel:(id)sender
{
    [self.delegate editMaterialControllerDidCancel:self];
}

- (IBAction)save:(id)sender
{
    NSString *materialName = [name text];
    NSString *materialQuantity = [quantity text];
    NSDate *materialDate = [date date];
    
    [self.delegate editMaterialController:self updatedMaterial:materialName withQuantity:materialQuantity forDate:materialDate atRow:[_selectedMaterial objectForKey:@"indexpath"]];
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _selectedMaterial = [[NSMutableDictionary alloc] init];
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
    
    self.name.text = [_selectedMaterial objectForKey:@"name"];
    self.quantity.text = [_selectedMaterial objectForKey:@"quantity"];    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    self.date.date = [formatter dateFromString:[_selectedMaterial objectForKey:@"date"]];
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
