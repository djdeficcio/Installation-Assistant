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

@implementation HomeScreen
@synthesize username;
@synthesize password;

- (IBAction)login:(id)sender {
    [self verifyLogin:self.username.text withPassword:self.password.text];
}

- (void)verifyLogin:(NSString *)usernameI withPassword:(NSString *)passwordI
{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [delegate managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Users" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *users = [context executeFetchRequest:fetchRequest error:&error];
    
    BOOL loggedIn = NO;
    
    for (Users *user in users) {
        if ([user.username isEqualToString:usernameI] && [user.password isEqualToString:passwordI]) {
            [[UserData sharedInstance] assignUsername:user.username withFirstName:user.firstname andLastName:user.lastname andCtid:[NSString stringWithFormat:@"%@", user.user_id]];
            loggedIn = YES;
            [self performSegueWithIdentifier:@"selectProjectSegue" sender:self];
        }
    }
    
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
