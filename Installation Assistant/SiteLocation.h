//
//  SiteLocation.h
//  Installation Assistant
//
//  Created by Solular on 4/10/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreLocation/CoreLocation.h"

@class SiteLocationView;

@interface SiteLocation : UIViewController <CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource>
{
    SiteLocationView *mainView;
    CLLocationManager *locationManager;
}

- (void)refreshLocation;
- (void)selectCrewLeader;
- (void)updateCrewLeaderView;
- (void)selectCrewMembers;
- (void)updateCrewMemberView;

@end
