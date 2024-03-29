//
//  CrewMembers.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 4/2/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//
// The view controller used for selecting crew members.  Declares delegate
// methods used to return the selected crew members to the view controller that called it.

#import <UIKit/UIKit.h>

@class CrewMembers;

@protocol crewMembersControllerDelegate <NSObject>

- (void)crewMembersControllerDidCancel:(CrewMembers *)controller;
- (void)crewMembersControllerDidSave:(CrewMembers *)controller;

@end

@interface CrewMembers : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *fieldCrew;
    NSMutableDictionary *selectedFieldCrew;
}
@property (weak, nonatomic) id<crewMembersControllerDelegate> delegate;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

- (void)confirmSelection;

@end
