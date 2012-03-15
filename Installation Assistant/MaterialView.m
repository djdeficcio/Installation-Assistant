//
//  MaterialView.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 2/7/12.
//  Copyright 2012 Solular, LLC. All rights reserved.
//	File created using Singleton XCode Template by Mugunth Kumar (http://blog.mugunthkumar.com)
//  More information about this template on the post http://mk.sg/89	
//  Permission granted to do anything, commercial/non-commercial with this file apart from removing the line/URL above

#import "MaterialView.h"
#import "ProjectData.h"

static MaterialView *_instance;
@implementation MaterialView

#pragma mark - Class Methods

- (void)openMail
{
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        
        mailer.mailComposeDelegate = self;
        
        [mailer setToRecipients:[NSArray arrayWithObject:@"tjcox@solularenergy.com"]];
        [mailer setSubject:[NSString stringWithFormat:@"Materials request for %@", [[ProjectData sharedInstance] projectName]]];
        
        [self presentViewController:mailer animated:NO completion:NULL];
    }
    
    else 
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                        message:@"Your device doesn't support sending mail."
                                                       delegate:nil
                                              cancelButtonTitle:@"Dismiss"
                                              otherButtonTitles: nil];
        [alert show];
    }
}

#pragma mark -
#pragma mark Singleton Methods

+ (MaterialView *)sharedInstance
{
    if (_instance == nil) {
        
        _instance = [[super allocWithZone:NULL] init];
        
        
    }

    return _instance;
}

- (id)init
{
    self = [super init];
    
    self.view = [[UIView alloc] initWithFrame:CGRectMake(168, 50, 550, 760)];
    
    return self;
}

+ (id)allocWithZone:(NSZone *)zone

{
    return _instance; //on subsequent allocation attempts return nil	
}


- (id)copyWithZone:(NSZone *)zone
{
    return self;	
}

#pragma mark -
#pragma mark Custom Methods

// Add your custom methods here

- (void)loadView
{
    [super loadView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 400, 400)];
    label.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:label];
}

@end
