//
//  CrewLeader.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 3/29/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CrewLeaderView, LocationView;

@interface CrewLeader : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    CrewLeaderView *mainView;
    LocationView *controllerToUpdate;
    
    NSMutableArray *crewLeaders;
    NSMutableArray *crewMembers;
    NSMutableDictionary *selectedLeader;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andControllerToUpdate:(LocationView *)controller;

- (void)presentSelf;
- (void)removeSelf;
- (void)confirmSelection;

@end
