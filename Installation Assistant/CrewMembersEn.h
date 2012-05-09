//
//  CrewMembersEn.h
//  AssistantUsers
//
//  Created by Solular on 5/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ReportsEn;

@interface CrewMembersEn : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * ctid;
@property (nonatomic, retain) ReportsEn *report;

@end
