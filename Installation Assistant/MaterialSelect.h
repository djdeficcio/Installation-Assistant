//
//  MaterialSelect.h
//  Installation Assistant
//
//  Created by Solular on 4/11/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddMaterial.h"
#import "EditMaterial.h"

@class MaterialSelect;

@protocol MaterialSelectDelegate <NSObject>

-(void)materialSelectControllerDidCancel:(MaterialSelect *)controller;
-(void)materialSelectController:(MaterialSelect *)controller updatedWithMaterials:(NSMutableArray *)materials;

@end

@interface MaterialSelect : UITableViewController <AddMaterialControllerDelegate, EditMaterialControllerDelegate>
{
    NSMutableArray *_materials;
    NSMutableDictionary *selectedMaterial;
}

@property (nonatomic, weak) id <MaterialSelectDelegate> delegate;
@property (retain, nonatomic) NSMutableArray *materials;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;


@end
