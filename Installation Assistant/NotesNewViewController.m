//
//  NotesNewViewController.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 2/3/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "NotesNewViewController.h"
#import "MenuBar.h"
#import "GlosslessButton.h"
#import "ProjectData.h"
#import "NotesView.h"

@implementation NotesNewViewController

- (NSString *)getUser
{
    id deviceIdentifier = [[UIDevice currentDevice] name];
    //NSLog(@"Identifier: %@", deviceIdentifier);
    
    NSString *userName;
    
    if ([deviceIdentifier isEqualToString:@"zPad"])
    {
        userName = @"DJ DeFiccio";
    }
    
    user = userName;
    
    return userName;
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

- (void)cancelNewNote
{
    [UIView animateWithDuration:.25 
                          delay:0.0 
                        options:UIViewAnimationCurveLinear 
                     animations:^{ self.view.frame = CGRectMake(550, 50, self.view.frame.size.width, self.view.frame.size.height);}
                     completion:^(BOOL finished) {
                         [self.view removeFromSuperview];
                     }];
}

- (void)saveNewNote
{
    projectID = [[ProjectData sharedInstance] projectID];
    
    NSDictionary *jsonDict = [NSDictionary dictionaryWithObjectsAndKeys: user, @"enteredBy", date, @"enteredOn", projectID, @"projectID", noteID, @"noteID", noteText.text, @"noteText", nil];
    
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDict options:kNilOptions error:&error];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://173.61.46.253/ios/notesViewNewEntry.php"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:jsonData];
    
    NSHTTPURLResponse *response;
    
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:NULL];
    
    [[NotesView sharedInstance] refreshNotes:projectID];
    [self cancelNewNote];
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
    
    userLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 2.5, 200, 20)];
    userLabel.numberOfLines = 0;
    userLabel.backgroundColor = [UIColor clearColor];
    userLabel.text = [self getUser];
    
    [heading addSubview:userLabel];
    
    dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(290, 2.5, 250, 20)];
    dateLabel.numberOfLines = 0;
    dateLabel.backgroundColor = [UIColor clearColor];
    dateLabel.textAlignment = UITextAlignmentRight;
    dateLabel.text = [self getDate];
    
    [heading addSubview:dateLabel];
    
    [self.view addSubview:heading];
    
    noteText = [[UITextView alloc] initWithFrame:CGRectMake(20, 45, 510, 590)];
    noteText.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.05];
    noteText.font = [UIFont systemFontOfSize:24.0];
    
    [self.view addSubview:noteText];
    
    GlosslessButton *cancel = [[GlosslessButton alloc] initWithFrame:CGRectMake(17, 645, 100, 50)];
    cancel.textLabel.text = @"Cancel";
    [cancel addTarget:self action:@selector(cancelNewNote) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:cancel];
    
    GlosslessButton *save = [[GlosslessButton alloc] initWithFrame:CGRectMake(433, 645, 100, 50)];
    save.textLabel.text = @"Save";
    [save addTarget:self action:@selector(saveNewNote) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:save];
}

- (id)initWithNoteID:(int)ID
{
    self = [super init];
    
    noteID = [NSString stringWithFormat:@"%d", ID];
    
    return self;
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
