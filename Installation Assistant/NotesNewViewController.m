//
//  NotesNewViewController.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 2/3/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "NotesNewViewController.h"
#import "UserData.h"
#import "ProjectData.h"
#import "DBGateway.h"

@implementation NotesNewViewController
@synthesize userLabel;
@synthesize dateLabel;
@synthesize noteText;
@synthesize noteID = _noteID;

- (IBAction)save:(id)sender {
    [self saveNewNote];
}

- (NSString *)getUser
{
    user = [NSString stringWithFormat:@"%@ %@", [[UserData sharedInstance] firstname], [[UserData sharedInstance] lastname]];
    deviceName = [[UIDevice currentDevice] name];
    userID = [[UserData sharedInstance] ctid];
    
    return user;
}

- (NSString *)getDate
{
    NSDate *rawDate = [NSDate date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    dateFormatter.dateFormat = @"MMMM d, yyyy";
    
    NSString *dateFormatString = [dateFormatter stringFromDate:rawDate];
    
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    
    timeFormatter.dateFormat = @"h:mma";
    
    NSString *timeFormatString = [[timeFormatter stringFromDate:rawDate] lowercaseString];
    
    NSString *dateString = [NSString stringWithFormat:@"%@ at %@", dateFormatString, timeFormatString];
    
    date = dateString;
    
    return dateString;
}

- (void)saveNewNote
{
    projectID = [[ProjectData sharedInstance] projectID];
    
    NSDictionary *note = [NSDictionary dictionaryWithObjectsAndKeys: user, @"entered_by", date, @"entered_on", projectID, @"project_id", _noteID, @"note_id", self.noteText.text, @"note_text", deviceName, @"device_name", userID, @"entered_by_id", nil];
    
    DBGateway *gateway = [[DBGateway alloc] init];
    [gateway enterNewNote:note];
    [self.navigationController popViewControllerAnimated:YES];
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self getUser];
    [self getDate];
    
    self.userLabel.text = user;
    self.dateLabel.text = date;
}


- (void)viewDidUnload
{
    [self setUserLabel:nil];
    [self setDateLabel:nil];
    [self setNoteText:nil];
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
