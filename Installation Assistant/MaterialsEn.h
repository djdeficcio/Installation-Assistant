//
//  MaterialsEn.h
//  AssistantUsers
//
//  Created by Solular on 5/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ReportsEn;

@interface MaterialsEn : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * date;
@property (nonatomic, retain) NSString * quantity;
@property (nonatomic, retain) ReportsEn *report;

@end
