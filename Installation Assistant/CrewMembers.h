//
//  CrewMembers.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 4/2/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CrewMembersView, SiteLocation;

@interface CrewMembers : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    CrewMembersView *mainView;
    SiteLocation *controllerToUpdate;
    
    NSMutableArray *fieldCrew;
    NSMutableDictionary *selectedFieldCrew;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andControllerToUpdate:(SiteLocation *)controller;

- (void)presentSelf;
- (void)removeSelf;
- (void)confirmSelection;

@end
