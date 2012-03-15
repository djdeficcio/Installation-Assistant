//
//  SiteInformation.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 12/1/11.
//  Copyright (c) 2011 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DualColumnTable.h"

@interface SiteInformation : UIViewController <UIGestureRecognizerDelegate>
{
    NSArray *dataPackage;
    DualColumnTable *techTable;
}

- (void)showSideMenu;
- (void)hideSideMenu;

@end
