//
//  ReportsEn.h
//  AssistantUsers
//
//  Created by Solular on 5/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
//  I'm pretty sure that I don't actually use this anywhere.  Don't delete it though, or Core Data will throw a fit.


#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CrewMembersEn, MaterialsEn;

@interface ReportsEn : NSManagedObject

@property (nonatomic, retain) NSString * client_notes;
@property (nonatomic, retain) NSString * client_updated;
@property (nonatomic, retain) NSString * completion_percentage;
@property (nonatomic, retain) NSString * crew_leader;
@property (nonatomic, retain) NSString * device_name;
@property (nonatomic, retain) NSString * location;
@property (nonatomic, retain) NSString * manager_update;
@property (nonatomic, retain) NSString * notes;
@property (nonatomic, retain) NSString * project_id;
@property (nonatomic, retain) NSString * project_manager;
@property (nonatomic, retain) NSString * temperature;
@property (nonatomic, retain) NSString * time_submitted;
@property (nonatomic, retain) NSString * weather;
@property (nonatomic, retain) NSString * author_username;
@property (nonatomic, retain) NSString * author_ctid;
@property (nonatomic, retain) NSSet *materials;
@property (nonatomic, retain) NSSet *crew_members;
@end

@interface ReportsEn (CoreDataGeneratedAccessors)

- (void)addMaterialsObject:(MaterialsEn *)value;
- (void)removeMaterialsObject:(MaterialsEn *)value;
- (void)addMaterials:(NSSet *)values;
- (void)removeMaterials:(NSSet *)values;

- (void)addCrew_membersObject:(CrewMembersEn *)value;
- (void)removeCrew_membersObject:(CrewMembersEn *)value;
- (void)addCrew_members:(NSSet *)values;
- (void)removeCrew_members:(NSSet *)values;

@end
