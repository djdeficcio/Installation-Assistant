//
//  SiteInformation.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 12/1/11.
//  Copyright (c) 2011 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DualColumnTable;

@interface SiteInformation : UIViewController <UIGestureRecognizerDelegate>
{
    NSArray *dataPackage;
    DualColumnTable *techTable;
}

@end
