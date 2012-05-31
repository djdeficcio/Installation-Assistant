//
//  HomeScreen.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 11/29/11.
//  Copyright (c) 2011 Solular, LLC. All rights reserved.
//

#import "HomeScreen.h"
#import "AppDelegate.h"
#import "Users.h"
#import "UserData.h"
#import "Reachability.h"

@implementation HomeScreen
@synthesize username;
@synthesize password;

- (IBAction)login:(id)sender {
    [self verifyLogin:self.username.text withPassword:self.password.text];
}

// Accepts a given username and password, and attempts to authenticate the user.
// Advances to the project selection screen and stores the logged in user on success,
// and displays an alert on validation failure.
- (void)verifyLogin:(NSString *)usernameI withPassword:(NSString *)passwordI
{
    // Getting the context for Core Data from the App Delegate
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [delegate managedObjectContext];
    
    // Creating the fetch request and using it to fetch an array of all users.
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Users" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *users = [context executeFetchRequest:fetchRequest error:&error];
    
    BOOL loggedIn = NO;
    
    // Iterate through the array of users and look for an entry that has both a 
    // username and password that match what was entered.
    for (Users *user in users) {
        if ([user.username isEqualToString:usernameI] && [user.password isEqualToString:passwordI]) {
            // Save the logged in user in the UserData singleton class.  This information is used
            // throughout the app as a way of identifying the user. Then, advance to the project selection screen.
            [[UserData sharedInstance] assignUsername:user.username withFirstName:user.firstname andLastName:user.lastname andCtid:[user.user_id stringValue]];
            loggedIn = YES;
            [self performSegueWithIdentifier:@"selectProjectSegue" sender:self];
        }
    }
    
    // Display an alert if the user failed to authenticate.
    if (!loggedIn) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert!" message:@"Invalid username/password" delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
        [alert show];
    }
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
    
    Reachability *wifi = [Reachability reachabilityForLocalWiFi];
    if ([wifi currentReachabilityStatus] == ReachableViaWiFi) {
        NSLog(@"Wifi enabled!");
    }
    
    else {
        NSLog(@"Wifi not available");
    }
    
}


- (void)viewDidUnload
{
    [self setUsername:nil];
    [self setPassword:nil];
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
