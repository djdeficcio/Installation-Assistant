//
//  Users.h
//  AssistantUsers
//
//  Created by Solular on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
//  The core data object used to store the login information to get into the app.

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Users : NSManagedObject

@property (nonatomic, retain) NSString * firstname;
@property (nonatomic, retain) NSString * lastname;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSNumber * user_id;

@end
