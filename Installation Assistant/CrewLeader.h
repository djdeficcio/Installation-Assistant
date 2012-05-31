//
//  CrewLeader.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 3/29/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//
//  The view controller used for selecting the crew leader.  This is most
//  commonly used as part of the reports screen, although it is fairly modular
//  and can be pretty safely used elsewhere.  It delcares a delegate method that
//  sends the selected crew leader (including name and ID) back to the view controller
//  that called it.

#import <UIKit/UIKit.h>

@class CrewLeader;

@protocol CrewLeaderControllerDelegate <NSObject>

- (void)crewLeaderControllerDidSave:(CrewLeader *)controller;

@end

@interface CrewLeader : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *crewLeaders;
    NSMutableArray *crewMembers;
    NSMutableDictionary *selectedLeader;
}
@property (weak, nonatomic) id <CrewLeaderControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITableView *crewLeaderList;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

@end
