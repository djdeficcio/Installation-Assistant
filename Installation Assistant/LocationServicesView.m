//
//  LocationServicesView.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 3/19/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "LocationServicesView.h"
#import "SiteLocation.h"
#import "MenuBar.h"
#import "Quartzcore/Quartzcore.h"
#import "CrewMemberData.h"
#import "GlosslessButton.h"

@implementation LocationServicesView
@synthesize location = _location, crewLeader = _crewLeader, crewMembers = _crewMembers, crewMemberList = _crewMemberList;

- (void)refreshAnimationForView:(UIView *)view
{
    view.backgroundColor = [UIColor colorWithRed:134.0/255.0 green:212.0/255.0 blue:253.0/255.0 alpha:1.0];
    [UIView animateWithDuration:0.5 animations:^{
        view.backgroundColor = [UIColor clearColor];
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
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = 1;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 10;
        
        parentController = parent;
        
        MenuBar *menubar = [[MenuBar alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 50)];
        [menubar setGradientStartColor:[UIColor colorWithRed:187.0/255.0 green:230.0/255.0 blue:252.0/255.0 alpha:1.0] AndEndColor:[UIColor colorWithRed:134.0/255.0 green:212.0/255.0 blue:253.0/255.0 alpha:1.0]];
        menubar.title.text = @"Check In";
        
        [self addSubview:menubar];
        
        locationInfo = [[UIView alloc] initWithFrame:CGRectMake(30, 80, 490, 170)];
        locationInfo.backgroundColor = [UIColor whiteColor];
        locationInfo.layer.cornerRadius = 10;
        locationInfo.layer.borderColor = [UIColor blackColor].CGColor;
        locationInfo.layer.borderWidth = 1;
        
        UILabel *locationInfoTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 470, 20)];
        locationInfoTitle.backgroundColor = [UIColor clearColor];
        locationInfoTitle.numberOfLines = 0;
        locationInfoTitle.text = @"Current Location:";
        locationInfoTitle.textColor = [UIColor grayColor];
        
        [locationInfo addSubview:locationInfoTitle];
        
        _location = [[UILabel alloc] initWithFrame:CGRectMake(30, 20, 430, 130)];
        _location.backgroundColor = [UIColor clearColor];
        _location.numberOfLines = 0;
        _location.font = [UIFont systemFontOfSize:24];
        _location.textAlignment = UITextAlignmentCenter;
        
        [locationInfo addSubview:_location];
        
        UITapGestureRecognizer *refreshLocation = [[UITapGestureRecognizer alloc] initWithTarget:parentController action:@selector(refreshLocation)];
        
        [locationInfo addGestureRecognizer:refreshLocation];
        
        [self addSubview:locationInfo];
        
        crewLeaderInfo = [[UIView alloc] initWithFrame:CGRectMake(30, 280, 230, 310)];
        crewLeaderInfo.backgroundColor = [UIColor whiteColor];
        crewLeaderInfo.layer.cornerRadius = 10;
        crewLeaderInfo.layer.borderColor = [UIColor blackColor].CGColor;
        crewLeaderInfo.layer.borderWidth = 1;
        
        UITapGestureRecognizer *selectCrewLeader = [[UITapGestureRecognizer alloc] initWithTarget:parentController action:@selector(selectCrewLeader)];
        
        [crewLeaderInfo addGestureRecognizer:selectCrewLeader];
        
        UILabel *crewLeaderTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 210, 20)];
        crewLeaderTitle.backgroundColor = [UIColor clearColor];
        crewLeaderTitle.numberOfLines = 0;
        crewLeaderTitle.text = @"Crew Leader:";
        crewLeaderTitle.textColor = [UIColor grayColor];
        
        [crewLeaderInfo addSubview:crewLeaderTitle];
        
        _crewLeader = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 170, 250)];
        _crewLeader.backgroundColor = [UIColor clearColor];
        _crewLeader.numberOfLines = 0;
        _crewLeader.text = [[CrewMemberData sharedInstance] crewLeaderName];
        _crewLeader.textAlignment = UITextAlignmentCenter;
        _crewLeader.font = [UIFont systemFontOfSize:28];
        
        [crewLeaderInfo addSubview:_crewLeader];
        
        [self addSubview:crewLeaderInfo];
        
        crewMemberInfo = [[UIView alloc] initWithFrame:CGRectMake(290, 280, 230, 450)];
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
        
        [crewMemberInfo addSubview:_crewMemberList];
        
        [self addSubview:crewMemberInfo];
        
        UITapGestureRecognizer *selectCrewMembers = [[UITapGestureRecognizer alloc] initWithTarget:parentController action:@selector(selectCrewMembers)];
        
        [crewMemberInfo addGestureRecognizer:selectCrewMembers];
        
        GlosslessButton *departureButton = [[GlosslessButton alloc] initWithFrame:CGRectMake(30, 620, 230, 110)];
        departureButton.textLabel.text = @"Continue";
        departureButton.textLabel.font = [UIFont systemFontOfSize:30];
        [departureButton addTarget:parentController action:@selector(updateCrewLeaderView) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:departureButton];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
