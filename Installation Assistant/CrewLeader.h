//
//  CrewLeader.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 3/29/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CrewLeaderView, SiteLocation;

@interface CrewLeader : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    CrewLeaderView *mainView;
    SiteLocation *controllerToUpdate;
    
    NSMutableArray *crewLeaders;
    NSMutableArray *crewMembers;
    NSMutableDictionary *selectedLeader;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andControllerToUpdate:(SiteLocation *)controller;

- (void)presentSelf;
- (void)removeSelf;
- (void)confirmSelection;

@end
