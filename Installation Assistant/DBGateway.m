//
//  DBGateway.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 3/28/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "DBGateway.h"


@implementation DBGateway

- (NSMutableArray *)executeScript:(NSString *)script
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@", scriptUrl, script];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSError *error;
    
    NSMutableArray *result = (NSMutableArray *)[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    NSLog(@"%@", result);
    
    return result;
}

- (NSMutableArray *)executeScript:(NSString *)script withPOSTData:(NSData *)data
{
    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@", scriptUrl, script]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:data];
    
    NSHTTPURLResponse *response;
    
    NSData *returnedData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:NULL];
    
    NSError *error;
    
    NSMutableArray *returnedArray = (NSMutableArray *)[NSJSONSerialization JSONObjectWithData:returnedData options:kNilOptions error:&error];
    
    return returnedArray;
}

- (void)executeNonReturningScript:(NSString *)script
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@", scriptUrl, script];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSError *error;
    
    NSMutableArray *result = (NSMutableArray *)[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    NSLog(@"%@", result);
    
}

- (void)executeNonReturningScript:(NSString *)script withPOSTData:(NSData *)data
{
    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@", scriptUrl, script]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:data];
    
    NSHTTPURLResponse *response;
    
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:NULL];
    
//    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init]completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
//        if (error) {
//            NSLog(@"Error: %@", error);
//        }
//    }];    
    
    
    
}

- (NSMutableArray *)getJSONDataForDict:(NSDictionary *)jsonDict fromScriptFile:(NSString *)scriptFile
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDict options:kNilOptions error:&error];
    
    NSMutableArray *returnedData = [self executeScript:scriptFile withPOSTData:jsonData];
    
    return returnedData;
}

- (NSMutableArray *)getCrewLeadersForState:(NSString *)state
{
    NSString *scriptString = [NSString stringWithFormat:@"retrieveCrewLeaders.php"];
    
    NSDictionary *jsonDict = [NSDictionary dictionaryWithObjectsAndKeys:state, @"state", nil];
    
    NSMutableArray *crewLeaders = [self getJSONDataForDict:jsonDict fromScriptFile:scriptString];
    
    return crewLeaders;
}

- (NSMutableArray *)getCrewMembersForState:(NSString *)state
{
    NSString *scriptString = [NSString stringWithFormat:@"retrieveCrewMembers.php"];
    
    NSDictionary *jsonDict = [NSDictionary dictionaryWithObjectsAndKeys:state, @"state", nil];
    
    NSMutableArray *crewMembers = [self getJSONDataForDict:jsonDict fromScriptFile:scriptString];
    
    return crewMembers;
}

- (NSMutableArray *)getAllFieldCrewForState:(NSString *)state
{
    NSString *scriptString = [NSString stringWithFormat:@"retrieveFieldCrew.php"];
    
    NSDictionary *jsonDict = [NSDictionary dictionaryWithObjectsAndKeys:state, @"state", nil];
    
    NSMutableArray *fieldCrew = [self getJSONDataForDict:jsonDict fromScriptFile:scriptString];
    
    NSLog(@"Field Crew: %@", fieldCrew);
    
    return fieldCrew;
}

- (void)submitReport:(NSDictionary *)report
{
    NSString *scriptString = [NSString stringWithFormat:@"submitReport.php"];
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:report options:kNilOptions error:nil];
    
    [self executeNonReturningScript:scriptString withPOSTData:jsonData];

}

- (NSURLRequest *)getProjectS1Request:(NSString *)projectID
{
    NSString *urlString = [NSString stringWithFormat:@"%@retrieveS1.php?id=%@", scriptUrl, projectID];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    return request;
}

- (NSURLRequest *)getProjectE1Request:(NSString *)projectID
{
    NSString *urlString = [NSString stringWithFormat:@"%@retrieveE1.php?id=%@", scriptUrl, projectID];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    return request;
}



@end
