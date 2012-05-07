//
//  UserData.m
//  Installation Assistant
//
//  Created by Solular on 5/7/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "UserData.h"

static UserData *_instance;

@implementation UserData
@synthesize username = _username;
@synthesize firstname = _firstname;
@synthesize lastname = _lastname;
@synthesize ctid = _ctid;

#pragma mark Custom Methods

- (void)assignUsername:(NSString *)username withFirstName:(NSString *)firstname andLastName:(NSString *)lastname andCtid:(NSString *)ctid
{
    _username = username;
    _firstname = firstname;
    _lastname = lastname;
    _ctid = ctid;
}


#pragma mark -
#pragma mark Singleton Methods

+ (UserData *)sharedInstance
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



@end
