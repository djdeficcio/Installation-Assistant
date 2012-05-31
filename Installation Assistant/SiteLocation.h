//
//  SiteLocation.h
//  Installation Assistant
//
//  Created by Solular on 4/10/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//
//  Don't let the class name fool you, this view controller is responsible for the reports feature.
//  It uses the Gateway to send the report to the server, with the information for the report being 
//  taken from a lot of different UI elements.

#import <UIKit/UIKit.h>
#import "CoreLocation/CoreLocation.h"
#import "MaterialSelect.h"
#import "CrewLeader.h"
#import "CrewMembers.h"
#import "CompletedPercentage.h"
#import "ManagerUpdate.h"
#import "WeatherSelect.h"
#import "TemperatureSelect.h"
#import "UpdateClient.h"

#define CREWMEMBERS 100
#define TASKS 101

@class RoundedUIView;

@interface SiteLocation : UIViewController <CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource, MaterialSelectDelegate, CrewLeaderControllerDelegate, crewMembersControllerDelegate, completedPercentageControllerDelegate, managerUpdateControllerDelegate, weatherSelectControllerDelegate, temperatureSelectControllerDelegate, updateClientControllerDelegate>
{
    CLLocationManager *locationManager;
    UIPopoverController *popoverController;
    
    NSMutableArray *taskList;
    UITableView *_taskTable;
    
    NSMutableArray *_materialList;
    
    CompletedPercentage *completedPercentageController;
    NSString  *completionPercentage;
    
    NSString *managerUpdateMessage;
    
    WeatherSelect *weatherSelectController;
    NSString *selectedWeather;
    
    TemperatureSelect *temperatureSelectController;
    NSString *selectedTemperature;
    
    NSInteger clientUpdated;
    NSString *clientUpdateNotes;
}

- (IBAction)submit:(id)sender;
@property (retain, nonatomic) NSMutableArray *materialList;
@property (strong, nonatomic) IBOutlet UITableView *TaskList;
@property (strong, nonatomic) IBOutlet UITableView *crewListTable;
@property (strong, nonatomic) IBOutlet UILabel *currentLocationLabel;
@property (strong, nonatomic) IBOutlet RoundedUIView *currentLocationView;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UITextView *noteTextView;

- (IBAction)submit:(id)sender;

- (NSMutableDictionary *)packageReport;
- (void)clearReportForm;
- (void)refreshLocation;
- (void)updateTableCellAccessoryAtRow:(NSInteger)row inSection:(NSInteger)section;
- (void)updateTableCellAccessoryAtRow:(NSInteger)row inSection:(NSInteger)section withDetail:(NSString *)detail;


@end
