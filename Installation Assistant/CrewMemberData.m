//
//  CrewMemberData.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 3/29/12.
//  Copyright 2012 Solular, LLC. All rights reserved.
//	File created using Singleton XCode Template by Mugunth Kumar (http://blog.mugunthkumar.com)
//  More information about this template on the post http://mk.sg/89	
//  Permission granted to do anything, commercial/non-commercial with this file apart from removing the line/URL above

#import "CrewMemberData.h"

static CrewMemberData *_instance;
@implementation CrewMemberData

#pragma mark -
#pragma mark Singleton Methods

#pragma mark -
#pragma mark Custom Methods

// Add your custom methods here

// Returns the name of the Crew Leader
- (NSString *)crewLeaderName
{
    return _crewLeaderName;
}

// Returns the ID number of the Crew Leader.  This number is generated by the "Crew Tracker" web application.
- (NSString *)crewLeaderId 
{
    return _crewLeaderId;
}

// Returns the current array of crew members.
- (NSMutableArray *)crewMembers
{
    return _crewMembers;
}

// Resets the crew leader's name and id to their default values.
- (void)resetCrewLeader
{
    _crewLeaderId = @"Not Selected";
    _crewLeaderName = @"Not Selected";
}

// Resets the current list of crew members.
- (void)resetCrewMembers
{
    [_crewMembers removeAllObjects];
}

// This assigns the current crew leader.
- (void)setCrewLeaderWithFirstName:(NSString *)firstname LastName:(NSString *)lastname AndId:(NSString *)leaderId
{
    _crewLeaderName = [NSString stringWithFormat:@"%@, %@", lastname, firstname];
    _crewLeaderId = leaderId;
}

// Adds a new crew member to the crew member array.
- (void)setCrewMemberWithFirstName:(NSString *)firstname LastName:(NSString *)lastname AndId:(NSString *)memberId
{
    NSDictionary *crewMember = [[NSDictionary alloc] initWithObjectsAndKeys:[NSString stringWithFormat:@"%@, %@", lastname, firstname], @"member_name", memberId, @"member_id", nil];
    [_crewMembers addObject:crewMember];
}

- (id)init
{
    self = [super init];
    if (self) {
        _crewMembers = [[NSMutableArray alloc] init];
        _crewLeaderName = @"Not Selected";
        _crewLeaderId = @"Not Selected";
    }
    
    return self;
}

+ (CrewMemberData *)sharedInstance
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
