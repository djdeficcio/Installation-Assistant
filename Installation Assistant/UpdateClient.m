//
//  UpdateClient.m
//  Installation Assistant
//
//  Created by Solular on 4/20/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "UpdateClient.h"

@interface UpdateClient ()

@end

@implementation UpdateClient
@synthesize updatedControl;
@synthesize notesTextView;
@synthesize delegate;
@synthesize updatedIndex = _updatedIndex, updatedNotes = _updatedNotes;

- (IBAction)save:(id)sender {
    
    NSInteger updatedIndex = self.updatedControl.selectedSegmentIndex;
    [self.delegate updateClientController:self didUpdateCustomer:updatedIndex withNotes:notesTextView.text];
}

- (IBAction)cancel:(id)sender {
    [self.delegate updateClientControllerDidCancel:self];
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.updatedControl.selectedSegmentIndex = _updatedIndex;
    self.notesTextView.text = _updatedNotes;
}

- (void)viewDidUnload
{
    [self setNotesTextView:nil];
    [self setUpdatedControl:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
