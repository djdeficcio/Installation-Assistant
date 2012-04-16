//
//  MaterialList.m
//  Installation Assistant
//
//  Created by Solular on 4/11/12.
//  Copyright 2012 Solular, LLC. All rights reserved.

#import "MaterialList.h"

@implementation MaterialList
@synthesize materials = _materials;

#pragma mark -
#pragma mark Custom Methods

- (void)clearMaterialList
{
    
}

- (void)addMaterial:(NSString *)material withQuantity:(NSInteger)quantity forDate:(NSString *)date
{
    
}

- (id)init {
    self = [super init];
    
    if (self) {
        _materials = [[NSMutableArray alloc] init];
    }
    
    return self;
}

#pragma mark -
#pragma mark Singleton Methods

+ (MaterialList *)sharedInstance 
{

	static MaterialList *_sharedInstance;
	if(!_sharedInstance) {
		static dispatch_once_t oncePredicate;
		dispatch_once(&oncePredicate, ^{
			_sharedInstance = [[super allocWithZone:nil] init];
			});
		}

		return _sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone 
{	
	return [self sharedInstance];
}


- (id)copyWithZone:(NSZone *)zone 
{
	return self;	
}



@end
