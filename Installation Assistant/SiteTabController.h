//
//  SiteTabController.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 12/6/11.
//  Copyright (c) 2011 Solular, LLC. All rights reserved.
//
//  The tab controller that manages the main tab view of the application.  The
//  logic for the "Tools" option in the navigation bar is maintained here.

#import <UIKit/UIKit.h>
#import "ToolsMenu.h"

@interface SiteTabController : UITabBarController <UITabBarControllerDelegate, ToolsMenuDelegate>
{
    UIPopoverController *popoverController;
}
@property (strong, nonatomic) IBOutlet UIBarButtonItem *toolsButton;
- (IBAction)showToolsMenu:(id)sender;
@end
