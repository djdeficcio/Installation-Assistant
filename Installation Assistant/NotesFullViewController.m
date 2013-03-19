//
//  NotesFullViewController.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 1/31/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "NotesFullViewController.h"
#import "QuartzCore/QuartzCore.h"

@implementation NotesFullViewController
@synthesize userLabel = _userLabel;
@synthesize dateLabel = _dateLabel;
@synthesize noteTextLabel = _noteTextLabel;
@synthesize enteredBy = _enteredBy, enterDate = _enterDate, noteText = _noteText;

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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.userLabel.text = _enteredBy;
    self.dateLabel.text = _enterDate;
    self.noteTextLabel.text = _noteText;
}


- (void)viewDidUnload
{
    [self setUserLabel:nil];
    [self setDateLabel:nil];
    [self setNoteTextLabel:nil];
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
