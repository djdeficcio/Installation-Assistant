//
//  SiteTabController.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 12/6/11.
//  Copyright (c) 2011 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToolsMenu.h"

@interface SiteTabController : UITabBarController <UITabBarControllerDelegate, ToolsMenuDelegate>
{
    UIPopoverController *popoverController;
}
@property (strong, nonatomic) IBOutlet UIBarButtonItem *toolsButton;
- (IBAction)showToolsMenu:(id)sender;
@end
