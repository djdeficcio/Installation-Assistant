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
#import "CrewLeader.h"
#define CREWMEMBERS 100
#define TASKS 101

@class SiteLocationView;
@class RoundedUIView;

@interface SiteLocation : UIViewController <CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource, MaterialSelectDelegate, CrewLeaderControllerDelegate>
{
    SiteLocationView *mainView;
    CLLocationManager *locationManager;
    
    NSMutableArray *_materialList;
    NSMutableArray *taskList;
    UITableView *_taskTable;
    
}

@property (retain, nonatomic) NSMutableArray *materialList;
@property (strong, nonatomic) IBOutlet UITableView *TaskList;
@property (strong, nonatomic) IBOutlet UITableView *crewListTable;
@property (strong, nonatomic) IBOutlet UILabel *currentLocationLabel;
@property (strong, nonatomic) IBOutlet RoundedUIView *currentLocationView;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;

- (void)refreshLocation;
- (void)selectCrewLeader;
- (void)updateCrewLeaderView;
- (void)selectCrewMembers;
- (void)updateCrewMemberView;
- (void)selectMaterials;
- (void)updateMaterials;

@end
