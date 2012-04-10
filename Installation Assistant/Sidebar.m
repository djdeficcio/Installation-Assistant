//
//  Sidebar.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 12/22/11.
//  Copyright 2011 Solular, LLC. All rights reserved.
//	File created using Singleton XCode Template by Mugunth Kumar (http://blog.mugunthkumar.com)
//  More information about this template on the post http://mk.sg/89	
//  Permission granted to do anything, commercial/non-commercial with this file apart from removing the line/URL above

#import "Sidebar.h"
#import "Quartzcore/Quartzcore.h"
#import "ProjectSelection.h"
#import "ProjectData.h"
#import <MessageUI/MessageUI.h>

static Sidebar *_instance;
@implementation Sidebar

#pragma mark -
#pragma mark Singleton Methods

+ (Sidebar *)sharedInstance:(UIViewController *)parent
{
    if (_instance == nil) {
        
        _instance = [[super allocWithZone:NULL] initWithParent:parent];
        
        
    }
    
    [_instance updateParent:parent];

    return _instance;
}

+ (id)allocWithZone:(NSZone *)zone

{
    return _instance; //on subsequent allocation attempts return nil	
}


- (id)copyWithZone:(NSZone *)zone
{
    return self;	
}

- (id)initWithParent:(UIViewController *)parent
{
    self = [super init];
    
    parentController = parent;
    
    compassDisplayed = NO;
    notesDisplayed = NO;
    materialsDisplayed = NO;
    managersDisplayed = NO;
    locationDisplayed = NO;
    
    //Create the view that holds the sidebar
    sidebarView = [[UIView alloc] initWithFrame:CGRectMake(-162, 50, 180, 760)];
    sidebarView.backgroundColor = [UIColor whiteColor];
    sidebarView.layer.cornerRadius = 10;
    
    //Create the array to hold the icons
    icons = [[NSMutableArray alloc] initWithArray:[NSArray arrayWithObjects:@"compass.png", @"notes.png", @"materials.png", @"managers.png", @"location.png", nil]];
    
    iconsPressed = [[NSMutableArray alloc] initWithArray:[NSArray arrayWithObjects:@"compassPressed.png", @"notesPressed.png", @"materialsPressed.png", @"managersPressed.png", @"locationPressed.png", nil]];
    
    //Initialize the array that will hold pointers for the tabbar options
    cellContainer = [[NSMutableArray alloc] init];
    iconContainer = [[NSMutableArray alloc] init];
                      
    UIColor *sidebarBackground = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"sidebarback.png"]];
    
    sidebarView.backgroundColor = sidebarBackground;
    
    //Create the table of menu options
    table = [[UITableView alloc] initWithFrame:CGRectMake(25, 25, 125, 760) style:UITableViewStylePlain];
    table.backgroundColor = [UIColor clearColor];
    table.separatorColor = [UIColor clearColor];
    table.rowHeight = 145;
    
    table.layer.opacity = 1;
    table.scrollEnabled = NO;
    table.dataSource = self;
    table.delegate = self;
    
    [sidebarView addSubview:table];
   
    
    return self;
}

- (void)updateParent:(UIViewController *)parent
{
    parentController = parent;
}

- (void)loadView
{
    NSLog(@"Sidebar view loading.");
    self.view = [[UIView alloc] init];
}

#pragma mark - 
#pragma mark Table Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [icons count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"Cell %i", indexPath.section]];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:[NSString stringWithFormat:@"Cell %i", indexPath.section]];
    }
    
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[icons objectAtIndex:indexPath.row]]];
    imageView.layer.cornerRadius = 10;
    imageView.layer.borderColor = [UIColor blackColor].CGColor;
    imageView.layer.borderWidth = 2;
    
    UIImageView *pressedView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[iconsPressed objectAtIndex:indexPath.row]]];
    pressedView.layer.cornerRadius = 10;
    pressedView.alpha = 0.0;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    pressedView.layer.borderColor = [UIColor blackColor].CGColor;
    pressedView.layer.borderWidth = 2;
    
    [cellContainer addObject:cell];
    [iconContainer addObject:pressedView];
    
    [cell addSubview:imageView];
    [cell addSubview:pressedView];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self selectedAnimation:indexPath];
    
    [self closeSidebarWindowsExcluding:indexPath.row];
    
    switch (indexPath.row) 
    {
        case 0:
            if (compassDisplayed == NO) {
                [sidebarView.superview addSubview:[[CompassView sharedInstance] getCompassView]];
                compassDisplayed = YES;
            }
            
            else 
            {
                [self closeSidebarWindows];
            }
            
            break;
            
        case 1:
            if (notesDisplayed == NO) 
            {
                [sidebarView.superview addSubview:[[NotesView sharedInstance] getNotesView]];
                notesDisplayed = YES;
            }
            
            else
            {
                [self closeSidebarWindows];
            }
            
            break;
            
        case 2:
            if (materialsDisplayed == NO)
            {
                [self presentMaterialView];
                 materialsDisplayed = YES;
            }
            
            else
            {
                [self closeSidebarWindows];
            }
            
            break;
            
        case 3:
            if (managersDisplayed == NO)
            {
                [self presentManagerView];
                managersDisplayed = YES;
            }
            
            else
            {
                [self closeSidebarWindows];
            }
            
            break;
            
        case 4:
//            if (locationDisplayed == NO) {
//                [sidebarView.superview addSubview:[[LocationView sharedInstance] getLocationView]];
//                locationDisplayed = YES;
//            }
//            
//            else {
//                [self closeSidebarWindows];
//            }
            
            break;
            
        default:
            NSLog(@"Default selected");
            break;
    }
    
    
}



#pragma mark -
#pragma mark Custom Methods

- (UIView *)getSidebarView
{
    return sidebarView;
}

- (void)showSidebarAnimation
{
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:.25];
    
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    sidebarView.transform = CGAffineTransformMakeTranslation(150, 0);
    
    [UIView commitAnimations];
}

- (void)hideSidebarAnimation
{
    [self closeSidebarWindows];
    
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:.25];
    
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    sidebarView.transform = CGAffineTransformMakeTranslation(-150, 0);
    
    [UIView commitAnimations];
}

- (void)selectedAnimation:(NSIndexPath *)indexPath
{
    //Make the pressed icon visible
    [[iconContainer objectAtIndex:indexPath.row] setAlpha:1];
    
    //Fade it back out
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    
    [[iconContainer objectAtIndex:indexPath.row] setAlpha:0];
    
    [UIView commitAnimations];
}

- (void)closeSidebarWindows
{
    if (compassDisplayed == YES)
    {
        [[CompassView sharedInstance] hideCompassView];
        compassDisplayed = NO;
    }
    
    if (notesDisplayed == YES)
    {
        [[NotesView sharedInstance] hideNotesView];
        notesDisplayed = NO;
    }
    
    if (materialsDisplayed == YES)
    {
        [materialView removeFromParentViewController];
        materialsDisplayed = NO;
    }
    
    if (managersDisplayed == YES)
    {
        [managerView removeFromParentViewController];
        managersDisplayed = NO;
    }
    
    if (locationDisplayed == YES) 
    {
        [[LocationView sharedInstance] hideLocationView];
        locationDisplayed = NO;
    }
}

- (void)closeSidebarWindowsExcluding:(NSInteger)windowID
{
    if (windowID != 0)
    {
        [[CompassView sharedInstance] hideCompassView];
        compassDisplayed = NO;
    }
    
    if (windowID != 1)
    {
        [[NotesView sharedInstance] hideNotesView];
        notesDisplayed = NO;
    }
    
    if (windowID != 2)
    {
        [materialView removeFromParentViewController];
        materialsDisplayed = NO;
    }
    
    if (windowID != 3)
    {
        [managerView removeFromParentViewController];
        managersDisplayed = NO;
    }
    
    if (windowID != 4)
    {
        [[LocationView sharedInstance] hideLocationView];
        locationDisplayed = NO;
    }
}

- (void)presentMaterialView
{
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        
        mailer.mailComposeDelegate = self;
        
        [mailer setToRecipients:[NSArray arrayWithObject:@"dand@solularenergy.com"]];
        [mailer setSubject:[NSString stringWithFormat:@"Materials request for %@", [[ProjectData sharedInstance] projectName]]];
        mailer.modalPresentationStyle = UIModalPresentationPageSheet;
        
        [parentController presentModalViewController:mailer animated:YES];
        
        materialView = mailer;
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

-(void)presentManagerView
{
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        
        mailer.mailComposeDelegate = self;
        
        [mailer setToRecipients:[NSArray arrayWithObject:[[ProjectData sharedInstance] projectManager]]];
        [mailer setSubject:[NSString stringWithFormat:@"Manager update for %@", [[ProjectData sharedInstance] projectName]]];
        mailer.modalPresentationStyle = UIModalPresentationPageSheet;
        
        [parentController presentModalViewController:mailer animated:YES];
        
        managerView = mailer;
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

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [controller dismissModalViewControllerAnimated:YES];
    
    UIAlertView *alert = [UIAlertView alloc];
    
    switch (result) {
            
        case MFMailComposeResultCancelled:
            break;
            
        case MFMailComposeResultSaved:
            break;
            
        case MFMailComposeResultSent:
            [alert initWithTitle:@"Success!"
                         message:@"Mail successfully sent."
                        delegate:nil
               cancelButtonTitle:@"Close" 
               otherButtonTitles:nil];
            [alert show];
            break;
            
        case MFMailComposeResultFailed:
            [alert initWithTitle:@"Failure"
                         message:@"Message failed to send."
                        delegate:nil
               cancelButtonTitle:@"Close"
               otherButtonTitles:nil];
            [alert show];
            break;
            
        default:
            break;
    }
    
    materialsDisplayed = NO;
    managersDisplayed = NO;
    NSLog(@"Mail protocol method");
}

@end
