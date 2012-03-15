//
//  ProjectData.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 11/22/11.
//  Copyright 2011 Solular, LLC. All rights reserved.
//	File created using Singleton XCode Template by Mugunth Kumar (http://blog.mugunthkumar.com)
//  More information about this template on the post http://mk.sg/89
//  Permission granted to do anything, commercial/non-commercial with this file apart from removing the line/URL above

#import <Foundation/Foundation.h>

@interface ProjectData : NSObject 
{
    NSString *projectName;
    NSString *primaryContact;
    NSString *siteAddress;
    NSString *contactPhoneNumber;
    NSString *utilityCompany;
    NSString *township;
    NSString *townshipPhoneNumber;
    
    NSString *panelType;
    NSString *panelQuantity;
    
    NSString *inverterType1;
    NSString *inverterQuantity1;
    NSString *inverterType2;
    NSString *inverterQuantity2;
    NSString *inverterType3;
    NSString *inverterQuantity3;
    NSString *inverterType4;
    NSString *inverterQuantity4;
    NSString *inverterType5;
    NSString *inverterQuantity5;
    
    NSString *orientation;
    NSString *rackingType;
    
    NSMutableArray *dataPackage;
    NSArray *dataLabelPackage;
    
    NSMutableArray *techPackage;
    NSArray *techLabelPackage;
    
    NSString *projectID;
    NSString *projectManager;
}
@property (retain) NSString *projectName;
@property (retain) NSString *primaryContact;
@property (retain) NSString *siteAddress;
@property (retain) NSString *contactPhoneNumber;
@property (retain) NSString *utilityCompany;
@property (retain) NSString *township;
@property (retain) NSString *townshipPhoneNumber;
@property (retain) NSString *panelType;
@property (retain) NSString *panelQuantity;
@property (retain) NSString *inverterType1;
@property (retain) NSString *inverterQuantity1;
@property (retain) NSString *inverterType2;
@property (retain) NSString *inverterQuantity2;
@property (retain) NSString *inverterType3;
@property (retain) NSString *inverterQuantity3;
@property (retain) NSString *inverterType4;
@property (retain) NSString *inverterQuantity4;
@property (retain) NSString *inverterType5;
@property (retain) NSString *inverterQuantity5;
@property (retain) NSString *orientation;
@property (retain) NSString *rackingType;
@property (retain) NSMutableArray *dataPackage;
@property (retain) NSArray *dataLabelPackage;
@property (retain) NSMutableArray *techPackage;
@property (retain) NSArray *techLabelPackage;
@property (retain) NSString *projectID;
@property (retain) NSString *projectManager;

+ (ProjectData *) sharedInstance;

- (void)packageData;


@end
