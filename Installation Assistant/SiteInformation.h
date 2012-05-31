//
//  SiteInformation.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 12/1/11.
//  Copyright (c) 2011 Solular, LLC. All rights reserved.
//
//  Displays the project data for the selected project.  Makes use of the 
//  "Dual Column Table" view, which could actually be removed if the interface is implemented using IB.
//  I hated IB when I started working on this project though, so I created a custom view to achieve
//  the interface that I wanted.  Oh well.

#import <UIKit/UIKit.h>

@class DualColumnTable;

@interface SiteInformation : UIViewController <UIGestureRecognizerDelegate>
{
    NSArray *dataPackage;
    DualColumnTable *techTable;
}

@end
