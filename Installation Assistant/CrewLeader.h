//
//  CrewLeader.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 3/29/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

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
