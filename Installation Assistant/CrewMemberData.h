//
//  CrewMemberData.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 3/29/12.
//  Copyright 2012 Solular, LLC. All rights reserved.
//	File created using Singleton XCode Template by Mugunth Kumar (http://blog.mugunthkumar.com)
//  More information about this template on the post http://mk.sg/89
//  Permission granted to do anything, commercial/non-commercial with this file apart from removing the line/URL above

#import <Foundation/Foundation.h>

@interface CrewMemberData : NSObject 
{
    NSString *_crewLeaderName;
    NSString *_crewLeaderId;
    NSMutableArray *_crewMembers;
}

+ (CrewMemberData *)sharedInstance;
- (NSString *)crewLeaderName;
- (NSString *)crewLeaderId;
- (NSMutableArray *)crewMembers;
- (void)resetCrewLeader;
- (void)resetCrewMembers;
- (void)setCrewLeaderWithFirstName:(NSString *)firstname LastName:(NSString *)lastname AndId:(NSString *)leaderId;
- (void)setCrewMemberWithFirstName:(NSString *)firstname LastName:(NSString *)lastname AndId:(NSString *)memberId;


@end
