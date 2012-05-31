//
//  DBGateway.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 3/28/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "DBGateway.h"
#import "Reachability.h"

@implementation DBGateway

// Executes a given script.  Expects the value passed to be the name of the file in question,
// and will add the rest of the url required to make the call.  This method expects that a 
// response will be returned.
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

// The same as the "executeScript" method, although this also adds POST data.  This method expects
// that a response will be returned.
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

// The same as the "executeScript" method, except that this method does not accept
// returned data.  
- (void)executeNonReturningScript:(NSString *)script
{
    NSString *urlString = [NSString stringWithFormat:@"%@%@", scriptUrl, script];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSError *error;
    
    NSMutableArray *result = (NSMutableArray *)[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    NSLog(@"%@", result);
    
}

// The same as the "executeNonReturningScript," although this also adds POST data.  
- (void)executeNonReturningScript:(NSString *)script withPOSTData:(NSData *)data
{
    NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@", scriptUrl, script]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:data];
    
    
    
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init]completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
        if (error) {
            NSLog(@"Error: %@", error);
        }
    }];      
}

// Accepts an NSDictionary and a script to execute, and returns the response.
- (NSMutableArray *)getJSONDataForDict:(NSDictionary *)jsonDict fromScriptFile:(NSString *)scriptFile
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDict options:kNilOptions error:&error];
    
    NSMutableArray *returnedData = [self executeScript:scriptFile withPOSTData:jsonData];
    
    return returnedData;
}

// Returns the crew leaders for a given state.  The crew leaders are selected from the "Crew 
// Tracker" web applications.
- (NSMutableArray *)getCrewLeadersForState:(NSString *)state
{
    NSString *scriptString = [NSString stringWithFormat:@"retrieveCrewLeaders.php"];
    
    NSDictionary *jsonDict = [NSDictionary dictionaryWithObjectsAndKeys:state, @"state", nil];
    
    NSMutableArray *crewLeaders = [self getJSONDataForDict:jsonDict fromScriptFile:scriptString];
    
    return crewLeaders;
}

// Returns the crew members for a given state.  The crew members are selected from the "Crew
// Tracker" web applications.
- (NSMutableArray *)getCrewMembersForState:(NSString *)state
{
    NSString *scriptString = [NSString stringWithFormat:@"retrieveCrewMembers.php"];
    
    NSDictionary *jsonDict = [NSDictionary dictionaryWithObjectsAndKeys:state, @"state", nil];
    
    NSMutableArray *crewMembers = [self getJSONDataForDict:jsonDict fromScriptFile:scriptString];
    
    return crewMembers;
}

// Returns both the crew leaders and members for a given state.  These folks are selected 
// from the "Crew Tracker" web application.
- (NSMutableArray *)getAllFieldCrewForState:(NSString *)state
{
    NSString *scriptString = [NSString stringWithFormat:@"retrieveFieldCrew.php"];
    
    NSDictionary *jsonDict = [NSDictionary dictionaryWithObjectsAndKeys:state, @"state", nil];
    
    NSMutableArray *fieldCrew = [self getJSONDataForDict:jsonDict fromScriptFile:scriptString];
    
    NSLog(@"Field Crew: %@", fieldCrew);
    
    return fieldCrew;
}

// Submits a report generated from the project reports screen, which is actually named "SiteLocation."
- (void)submitReport:(NSDictionary *)report
{
    NSString *scriptString = [NSString stringWithFormat:@"submitReport.php"];
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:report options:kNilOptions error:nil];
    
    [self executeNonReturningScript:scriptString withPOSTData:jsonData];
}

// Returns an NSURLRequest for the S1 for the given project.  This is then loaded into a UIWebView.
- (NSURLRequest *)getProjectS1Request:(NSString *)projectID
{
    NSString *urlString = [NSString stringWithFormat:@"%@retrieveS1.php?id=%@", scriptUrl, projectID];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    return request;
}

// Returns an NSURLRequest for the E1 for the given project.  This is then loaded into a UIWebView.
- (NSURLRequest *)getProjectE1Request:(NSString *)projectID
{
    NSString *urlString = [NSString stringWithFormat:@"%@retrieveE1.php?id=%@", scriptUrl, projectID];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    return request;
}

// Inserts a new note into the database.
- (void)enterNewNote:(NSDictionary *)note
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:note options:kNilOptions error:&error];
    
    [self executeNonReturningScript:@"notesViewNewEntry.php" withPOSTData:jsonData];
}

// Returns the notes for a given project.
- (NSArray *)getNotesForProject:(NSString *)projectID
{
    NSString *urlString = [NSString stringWithFormat:@"notesViewNoteRetrieval.php?id=%@", projectID];
    
    NSArray *notes = [self executeScript:urlString];
    
    return notes;
}



@end
