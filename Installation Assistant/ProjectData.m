//
//  ProjectData.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 11/22/11.
//  Copyright 2011 Solular, LLC. All rights reserved.
//	File created using Singleton XCode Template by Mugunth Kumar (http://blog.mugunthkumar.com)
//  More information about this template on the post http://mk.sg/89	
//  Permission granted to do anything, commercial/non-commercial with this file apart from removing the line/URL above

#import "ProjectData.h"

static ProjectData *_instance;
@implementation ProjectData
@synthesize projectName, primaryContact, siteAddress, contactPhoneNumber, utilityCompany, township, townshipPhoneNumber, panelType, panelQuantity, inverterType1, inverterType2, inverterType3, inverterType4, inverterType5, inverterQuantity1, inverterQuantity2, inverterQuantity3, inverterQuantity4, inverterQuantity5, orientation, rackingType, dataPackage, dataLabelPackage, techPackage, techLabelPackage, projectID, projectManager
;

#pragma mark -
#pragma mark Singleton Methods

+ (ProjectData *)sharedInstance
{
    if (_instance == nil) {
        
        _instance = [[super allocWithZone:NULL] init];
        
    }

    return _instance;
}

+ (id)allocWithZone:(NSZone *)zone

{
    return _instance; //on subsequent allocation attempts return nil	
}


- (id)copyWithZone:(NSZone *)zone
{
    return self;	
}

#pragma mark -
#pragma mark Custom Methods

- (id)init
{
    self = [super init];
    
    dataPackage = [[NSMutableArray alloc] init];
    
    dataLabelPackage = [[NSArray alloc] initWithObjects:@"Contact:", @"Phone:", @"Township:", @"Site \nAddress:", @"Utility Company:", @"Township Phone:", nil];
    
    techPackage = [[NSMutableArray alloc] init];
    
    techLabelPackage = [[NSArray alloc] initWithObjects:@"Panel Type:", @"Orientation:", @"Inverter \nType 1:", @"Inverter \nType 2:", @"Inverter \nType 3:", @"Inverter \nType 4:", @"Inverter \nType 5:", @"Panel \nQuantity:", @"Racking \nType:", @"Inverter Quantity 1:", @"Inverter Quantity 2:", @"Inverter Quantity 3:", @"Inverter Quantity 4:", @"Inverter Quantity 5:", nil];
    
    return self;
}

- (void)packageData
{
    dataPackage = [NSMutableArray arrayWithObjects:primaryContact, contactPhoneNumber, township, siteAddress, utilityCompany, townshipPhoneNumber, nil];
        
    
    techPackage = [NSMutableArray arrayWithObjects:panelType, orientation, inverterType1, inverterType2, inverterType3, inverterType4, inverterType5, panelQuantity, rackingType, inverterQuantity1, inverterQuantity2, inverterQuantity3, inverterQuantity4, inverterQuantity5, nil];
    
}

@end
