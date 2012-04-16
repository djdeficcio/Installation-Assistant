//
//  MaterialList.h
//  Installation Assistant
//
//  Created by Solular on 4/11/12.
//  Copyright 2012 Solular, LLC. All rights reserved.

#import <Foundation/Foundation.h>

@interface MaterialList : NSObject
{
    NSMutableArray *_materials;
}
@property (retain) NSMutableArray *materials;

+ (MaterialList *)sharedInstance;
- (void)addMaterial:(NSString *)material withQuantity:(NSInteger)quantity forDate:(NSString *)date;
- (void)clearMaterialList;

@end
