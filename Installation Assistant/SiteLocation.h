//
//  SiteLocation.h
//  Installation Assistant
//
//  Created by Solular on 4/10/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreLocation/CoreLocation.h"
#import "MaterialSelect.h"

@class SiteLocationView;

@interface SiteLocation : UIViewController <CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource, MaterialSelectDelegate>
{
    SiteLocationView *mainView;
    CLLocationManager *locationManager;
    
    NSMutableArray *_materialList;
}

@property (retain, nonatomic) NSMutableArray *materialList;

- (void)refreshLocation;
- (void)selectCrewLeader;
- (void)updateCrewLeaderView;
- (void)selectCrewMembers;
- (void)updateCrewMemberView;
- (void)selectMaterials;
- (void)updateMaterials;

@end
