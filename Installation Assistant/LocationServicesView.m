//
//  LocationServicesView.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 3/19/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "LocationServicesView.h"
#import "MenuBar.h"
#import "Quartzcore/Quartzcore.h"

@implementation LocationServicesView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = 1;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 10;
        
        MenuBar *menubar = [[MenuBar alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 50)];
        [menubar setGradientStartColor:[UIColor colorWithRed:187.0/255.0 green:230.0/255.0 blue:252.0/255.0 alpha:1.0] AndEndColor:[UIColor colorWithRed:134.0/255.0 green:212.0/255.0 blue:253.0/255.0 alpha:1.0]];
        menubar.title.text = @"Check In";
        
        [self addSubview:menubar];
        
        UIView *locationInfo = [[UIView alloc] initWithFrame:CGRectMake(30, 80, 230, 500)];
        locationInfo.backgroundColor = [UIColor whiteColor];
        locationInfo.layer.cornerRadius = 10;
        locationInfo.layer.borderColor = [UIColor blackColor].CGColor;
        locationInfo.layer.borderWidth = 1;
        
        [self addSubview:locationInfo];
        
        UIView *crewMembers = [[UIView alloc] initWithFrame:CGRectMake(290, 80, 230, 500)];
        crewMembers.backgroundColor = [UIColor whiteColor];
        crewMembers.layer.cornerRadius = 10;
        crewMembers.layer.borderColor = [UIColor blackColor].CGColor;
        crewMembers.layer.borderWidth = 1;
        
        [self addSubview:crewMembers];
        
        UIButton *departureButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        departureButton.frame = CGRectMake(130, 622.5, 290, 90);
        
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
