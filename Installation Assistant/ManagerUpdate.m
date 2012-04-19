//
//  ManagerUpdate.m
//  Installation Assistant
//
//  Created by Solular on 4/19/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "ManagerUpdate.h"
#import "Quartzcore/Quartzcore.h"

@interface ManagerUpdate ()

@end

@implementation ManagerUpdate
@synthesize updateTextView;
@synthesize delegate;

- (IBAction)save:(id)sender {
    [self.delegate managerUpdateController:self didSaveMessage:[self.updateTextView text]];
}

- (IBAction)cancel:(id)sender {
    [self.delegate managerUpdateControllerDidCancel:self];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.updateTextView.layer.cornerRadius = 10;
    self.updateTextView.layer.borderColor = [UIColor darkGrayColor].CGColor;
    self.updateTextView.layer.borderWidth = 2;
}

- (void)viewDidUnload
{
    [self setUpdateTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end