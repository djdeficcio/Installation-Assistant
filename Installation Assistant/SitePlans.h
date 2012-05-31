//
//  SitePlans.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 12/1/11.
//  Copyright (c) 2011 Solular, LLC. All rights reserved.
//
//  Loads the site plans for the selected project into a web view.

#import <UIKit/UIKit.h>

@interface SitePlans : UIViewController 

@property (strong, nonatomic) IBOutlet UISegmentedControl *planSelector;
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (strong, nonatomic) IBOutlet UIWebView *s1View;
@property (strong, nonatomic) IBOutlet UIWebView *e1View;
- (IBAction)changePlanView:(id)sender;

- (void)showOrHideMenu;
- (void)showS1View;
- (void)showE1View;

@end
