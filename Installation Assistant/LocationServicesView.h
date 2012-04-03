//
//  LocationServicesView.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 3/19/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LocationView;

@interface LocationServicesView : UIView
{
    LocationView *parentController;
    UIView *locationInfo;
    UIView *crewLeaderInfo;
    UIView *crewMemberInfo;
    UILabel *_location;
    UILabel *_crewLeader;
    NSMutableArray *_crewMembers;
    UITableView *_crewMemberList;
}
@property (retain) UILabel *location;
@property (retain) UILabel *crewLeader;
@property (retain) NSMutableArray *crewMembers;
@property (retain) UITableView *crewMemberList;

- (id)initWithFrame:(CGRect)frame andParentController:(LocationView *)parent;

- (void)refreshAnimationForView:(UIView *)view;
- (void)selectCrewLeaderAnimation;
- (void)selectCrewMemberAnimation;
- (void)refreshLocationAnimation;

@end
