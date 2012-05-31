//
//  SiteViews.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 12/1/11.
//  Copyright (c) 2011 Solular, LLC. All rights reserved.
// 
//  The view controller responsible for displaying the Google Maps overhead view.

#import <UIKit/UIKit.h>

@interface SiteViews : UIViewController
{
    IBOutlet UIWebView *googleView;
}

- (void)displayCurrentLocation;

@end
