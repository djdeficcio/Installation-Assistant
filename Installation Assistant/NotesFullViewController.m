//
//  NotesFullViewController.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 1/31/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "NotesFullViewController.h"
#import "MenuBar.h"
#import "QuartzCore/QuartzCore.h"

@implementation NotesFullViewController

- (void)setFullNoteValues:(NSString *)noteValue enteredBy:(NSString *)userValue enteredOn:(NSString *)dateValue
{
    enteredBy.text = userValue;
    enterDate.text = dateValue;
    noteText.text = noteValue;
    [noteText sizeToFit];
    
    [self.view setNeedsDisplay];
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


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:CGRectMake(550, 50, 550, 760)];
    self.view.backgroundColor = [UIColor whiteColor];
    
    MenuBar *heading = [[MenuBar alloc] initWithFrame:CGRectMake(0, 0, 550, 25)];
    
    enteredBy = [[UILabel alloc] initWithFrame:CGRectMake(10, 2.5, 200, 20)];
    enteredBy.numberOfLines = 0;
    enteredBy.backgroundColor = [UIColor clearColor];
    
    [heading addSubview:enteredBy];
    
    enterDate = [[UILabel alloc] initWithFrame:CGRectMake(290, 2.5, 250, 20)];
    enterDate.numberOfLines = 0;
    enterDate.backgroundColor = [UIColor clearColor];
    enterDate.textAlignment = UITextAlignmentRight;
    
    [heading addSubview:enterDate];
    
    [self.view addSubview:heading];
    
    noteText = [[UILabel alloc] initWithFrame:CGRectMake(25, 50, 500, 635)];
    noteText.numberOfLines = 0;
    noteText.backgroundColor = [UIColor clearColor];
    noteText.textAlignment = UITextAlignmentLeft;
    
    [self.view addSubview:noteText];
    
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

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
