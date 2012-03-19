//
//  LocationView.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 3/19/12.
//  Copyright 2012 Solular, LLC. All rights reserved.
//	File created using Singleton XCode Template by Mugunth Kumar (http://blog.mugunthkumar.com)
//  More information about this template on the post http://mk.sg/89	
//  Permission granted to do anything, commercial/non-commercial with this file apart from removing the line/URL above

#import "LocationView.h"

static LocationView *_instance;
@implementation LocationView


#pragma mark -
#pragma mark Custom Methods



#pragma mark -
#pragma mark Singleton Methods

+ (LocationView *)sharedInstance
{
    if (_instance == nil) {
        
        _instance = [[super allocWithZone:NULL] init];
        
        //Initialize instance variables
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
