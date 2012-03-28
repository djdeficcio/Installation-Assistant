//
//  LocationServicesView.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 3/19/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "LocationServicesView.h"
#import "LocationView.h"
#import "MenuBar.h"
#import "Quartzcore/Quartzcore.h"

@implementation LocationServicesView
@synthesize location = _location;

- (void)refreshLocationAnimation {
    locationInfo.backgroundColor = [UIColor colorWithRed:134.0/255.0 green:212.0/255.0 blue:253.0/255.0 alpha:1.0];
    [UIView animateWithDuration:0.5 animations:^{
        locationInfo.backgroundColor = [UIColor clearColor];
    }];
}

#pragma mark -
#pragma mark Init methods

- (id)initWithFrame:(CGRect)frame andParentController:(LocationView *)parent
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
        
        _location = [[UILabel alloc] initWithFrame:CGRectMake(30, 40, 430, 110)];
        _location.backgroundColor = [UIColor clearColor];
        _location.numberOfLines = 0;
        _location.font = [UIFont systemFontOfSize:24];
        _location.textAlignment = UITextAlignmentCenter;
        
        [locationInfo addSubview:_location];
        
        UITapGestureRecognizer *refreshLocation = [[UITapGestureRecognizer alloc] initWithTarget:parentController action:@selector(refreshLocation)];
        
        [locationInfo addGestureRecognizer:refreshLocation];
        
        [self addSubview:locationInfo];
        
        UIView *crewLeader = [[UIView alloc] initWithFrame:CGRectMake(30, 280, 230, 310)];
        crewLeader.backgroundColor = [UIColor whiteColor];
        crewLeader.layer.cornerRadius = 10;
        crewLeader.layer.borderColor = [UIColor blackColor].CGColor;
        crewLeader.layer.borderWidth = 1;
        
        [self addSubview:crewLeader];
        
        UIView *crewMembers = [[UIView alloc] initWithFrame:CGRectMake(290, 280, 230, 450)];
        crewMembers.backgroundColor = [UIColor whiteColor];
        crewMembers.layer.cornerRadius = 10;
        crewMembers.layer.borderColor = [UIColor blackColor].CGColor;
        crewMembers.layer.borderWidth = 1;
        
        [self addSubview:crewMembers];
        
        UIButton *departureButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        departureButton.frame = CGRectMake(30, 620, 230, 110);
        
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
