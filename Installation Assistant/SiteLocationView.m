//
//  SiteLocationView.m
//  Installation Assistant
//
//  Created by Solular on 4/10/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "SiteLocationView.h"
#import "SiteLocation.h"
#import "MenuBar.h"
#import "Quartzcore/Quartzcore.h"
#import "CrewMemberData.h"
#import "GlosslessButton.h"

@implementation SiteLocationView
@synthesize location = _location, crewLeader = _crewLeader, crewMembers = _crewMembers, crewMemberList = _crewMemberList, materialList = _materialList;

- (void)refreshAnimationForView:(UIView *)view
{
    view.backgroundColor = [UIColor colorWithRed:134.0/255.0 green:212.0/255.0 blue:253.0/255.0 alpha:1.0];
    [UIView animateWithDuration:0.5 animations:^{
        view.backgroundColor = [UIColor whiteColor];
    }];
}

- (void)refreshLocationAnimation
{
    [self refreshAnimationForView:locationInfo];
}

- (void)selectCrewLeaderAnimation
{
    [self refreshAnimationForView:crewLeaderInfo];
}

- (void)selectCrewMemberAnimation
{
    [self refreshAnimationForView:crewMemberInfo];
}

#pragma mark -
#pragma mark Init methods

- (id)initWithFrame:(CGRect)frame andParentController:(SiteLocation *)parent
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIColor *brushedMetal = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"brushedmetal.png"]];
        self.backgroundColor = brushedMetal;
        
        parentController = parent;
        
        locationInfo = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 380, 170)];
        locationInfo.backgroundColor = [UIColor whiteColor];
        locationInfo.layer.cornerRadius = 10;
        locationInfo.layer.borderColor = [UIColor blackColor].CGColor;
        locationInfo.layer.borderWidth = 1;
        
        UILabel *locationInfoTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 360, 20)];
        locationInfoTitle.backgroundColor = [UIColor clearColor];
        locationInfoTitle.numberOfLines = 0;
        locationInfoTitle.text = @"Current Location:";
        locationInfoTitle.textColor = [UIColor grayColor];
        
        [locationInfo addSubview:locationInfoTitle];
        
        _location = [[UILabel alloc] initWithFrame:CGRectMake(30, 20, 320, 130)];
        _location.backgroundColor = [UIColor clearColor];
        _location.numberOfLines = 0;
        _location.font = [UIFont systemFontOfSize:24];
        _location.textAlignment = UITextAlignmentCenter;
        
        [locationInfo addSubview:_location];
        
        UITapGestureRecognizer *refreshLocation = [[UITapGestureRecognizer alloc] initWithTarget:parentController action:@selector(refreshLocation)];
        
        [locationInfo addGestureRecognizer:refreshLocation];
        
        [self addSubview:locationInfo];
        
        crewLeaderInfo = [[UIView alloc] initWithFrame:CGRectMake(480, 50, 238, 170)];
        crewLeaderInfo.backgroundColor = [UIColor whiteColor];
        crewLeaderInfo.layer.cornerRadius = 10;
        crewLeaderInfo.layer.borderColor = [UIColor blackColor].CGColor;
        crewLeaderInfo.layer.borderWidth = 1;
        
        UITapGestureRecognizer *selectCrewLeader = [[UITapGestureRecognizer alloc] initWithTarget:parentController action:@selector(selectCrewLeader)];
        
        [crewLeaderInfo addGestureRecognizer:selectCrewLeader];
        
        UILabel *crewLeaderTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 190, 20)];
        crewLeaderTitle.backgroundColor = [UIColor clearColor];
        crewLeaderTitle.numberOfLines = 0;
        crewLeaderTitle.text = @"Crew Leader:";
        crewLeaderTitle.textColor = [UIColor grayColor];
        
        [crewLeaderInfo addSubview:crewLeaderTitle];
        
        _crewLeader = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 158, 110)];
        _crewLeader.backgroundColor = [UIColor clearColor];
        _crewLeader.numberOfLines = 0;
        _crewLeader.text = [[CrewMemberData sharedInstance] crewLeaderName];
        _crewLeader.textAlignment = UITextAlignmentCenter;
        _crewLeader.font = [UIFont systemFontOfSize:28];
        
        [crewLeaderInfo addSubview:_crewLeader];
        
        [self addSubview:crewLeaderInfo];
        
        crewMemberInfo = [[UIView alloc] initWithFrame:CGRectMake(480, 270, 238, 450)];
        crewMemberInfo.backgroundColor = [UIColor whiteColor];
        crewMemberInfo.layer.cornerRadius = 10;
        crewMemberInfo.layer.borderColor = [UIColor blackColor].CGColor;
        crewMemberInfo.layer.borderWidth = 1;
        crewMemberInfo.layer.masksToBounds = YES;
        
        UILabel *crewMemberTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 210, 20)];
        crewMemberTitle.backgroundColor = [UIColor clearColor];
        crewMemberTitle.numberOfLines = 0;
        crewMemberTitle.text = @"Crew Members:";
        crewMemberTitle.textColor = [UIColor grayColor];
        
        [crewMemberInfo addSubview:crewMemberTitle];
        
        _crewMemberList = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, crewMemberInfo.frame.size.width, crewMemberInfo.frame.size.height) style:UITableViewStylePlain];
        _crewMemberList.delegate = parentController;
        _crewMemberList.dataSource = parentController;
        _crewMemberList.tag = CREWMEMBERS;
        
        [crewMemberInfo addSubview:_crewMemberList];
        
        [self addSubview:crewMemberInfo];
        
        UITapGestureRecognizer *selectCrewMembers = [[UITapGestureRecognizer alloc] initWithTarget:parentController action:@selector(selectCrewMembers)];
        
        [crewMemberInfo addGestureRecognizer:selectCrewMembers];
        
        materialListInfo = [[UIView alloc] initWithFrame:CGRectMake(50, 270, 380, 100)];
        materialListInfo.backgroundColor = [UIColor whiteColor];
        materialListInfo.layer.cornerRadius = 10;
        materialListInfo.layer.borderColor = [UIColor blackColor].CGColor;
        materialListInfo.layer.borderWidth = 1;
        materialListInfo.layer.masksToBounds = YES;
        
        UILabel *materialListTitle = [[UILabel alloc] initWithFrame:CGRectMake(20, materialListInfo.bounds.size.height, 280, 20)];
        materialListTitle.backgroundColor = [UIColor clearColor];
        materialListTitle.numberOfLines = 1;
        materialListTitle.text = @"Material Requests:";
        materialListTitle.textColor = [UIColor grayColor];
        
        [materialListInfo addSubview:materialListTitle];
        
//        _materialList = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, materialListInfo.frame.size.width, materialListInfo.frame.size.height) style:UITableViewStylePlain];
//        _materialList.delegate = parentController;
//        _materialList.dataSource = parentController;
//        _materialList.tag = MATERIALS;
//        _materialList.allowsSelection = NO;
//        
//        [materialListInfo addSubview:_materialList];
        
        UITapGestureRecognizer *selectMaterialList = [[UITapGestureRecognizer alloc] initWithTarget:parentController action:@selector(selectMaterials)];
        
        [materialListInfo addGestureRecognizer:selectMaterialList];
        
        [self addSubview:materialListInfo];
        
        GlosslessButton *departureButton = [[GlosslessButton alloc] initWithFrame:CGRectMake(475, 765, 248, 100)];
        [departureButton setButtonStartColor:[UIColor colorWithRed:94.0/255.0 green:222.0/255.0 blue:68.0/255.0 alpha:1.0] AndEndColor:[UIColor colorWithRed:81.0/255.0 green:192.0/255.0 blue:58.0/255.0 alpha:1.0] AndBorderColor:[UIColor colorWithRed:71.0/255.0 green:118.0/255.0 blue:51.0/255.0 alpha:1.0]];
        departureButton.textLabel.text = @"Continue";
        departureButton.textLabel.font = [UIFont systemFontOfSize:30];
        [departureButton addTarget:parentController action:@selector(updateCrewLeaderView) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:departureButton];
        
    }
    return self;
}

@end
