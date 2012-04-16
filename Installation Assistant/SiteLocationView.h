//
//  SiteLocationView.h
//  Installation Assistant
//
//  Created by Solular on 4/10/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#define CREWMEMBERS 0
#define MATERIALS 1

@class SiteLocation;

@interface SiteLocationView : UIView
{
    SiteLocation *parentController;
    UIView *locationInfo;
    UIView *crewLeaderInfo;
    UIView *crewMemberInfo;
    UIView *materialListInfo;
    UILabel *_location;
    UILabel *_crewLeader;
    NSMutableArray *_crewMembers;
    UITableView *_crewMemberList;
    UITableView *_materialList;
}
@property (retain) UILabel *location;
@property (retain) UILabel *crewLeader;
@property (retain) NSMutableArray *crewMembers;
@property (retain) UITableView *crewMemberList;
@property (retain) UITableView *materialList;

- (id)initWithFrame:(CGRect)frame andParentController:(SiteLocation *)parent;

- (void)refreshAnimationForView:(UIView *)view;
- (void)selectCrewLeaderAnimation;
- (void)selectCrewMemberAnimation;
- (void)refreshLocationAnimation;
@end
