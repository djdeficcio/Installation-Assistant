//
//  DBGateway.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 3/28/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#define scriptUrl @"http://173.61.46.253/ios/"

@interface DBGateway : NSObject

- (NSMutableArray *)executeScript:(NSString *)script;
- (NSMutableArray *)executeScript:(NSString *)script withPOSTData:(NSData *)data;
- (void)executeNonReturningScript:(NSString *)script;
- (void)executeNonReturningScript:(NSString *)script withPOSTData:(NSData *)data;
- (NSMutableArray *)getJSONDataForDict:(NSDictionary *)JSONdict fromScriptFile:(NSString *)scriptFile;
- (NSMutableArray *)getCrewLeadersForState:(NSString *)state;
- (NSMutableArray *)getCrewMembersForState:(NSString *)state;
- (NSMutableArray *)getAllFieldCrewForState:(NSString *)state;
- (void)submitReport:(NSDictionary *)report;
- (NSURLRequest *)getProjectS1Request:(NSString *)projectID;
- (NSURLRequest *)getProjectE1Request:(NSString *)projectID;

@end
