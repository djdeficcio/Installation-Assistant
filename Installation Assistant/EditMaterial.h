//
//  EditMaterial.h
//  Installation Assistant
//
//  Created by Solular on 4/12/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//
//  This view controller is used for editing an already selected material.  It could
//  probably be consolidated with the "AddMaterial" class, but I'm too lazy to do it right now.
//  It declares two delegate methods used for confirming or canceling the changes made to the given material.

#import <UIKit/UIKit.h>

@class EditMaterial;

@protocol EditMaterialControllerDelegate <NSObject>

- (void)editMaterialControllerDidCancel:(EditMaterial *)controller;
- (void)editMaterialController:(EditMaterial *)controller updatedMaterial:(NSString *)materialName withQuantity:(NSString *)materialQuantity forDate:(NSDate *)materialDate atRow:(NSIndexPath *)indexPath;

@end

@interface EditMaterial : UIViewController
{
    NSMutableDictionary *_selectedMaterial;
}

@property (weak, nonatomic) id <EditMaterialControllerDelegate> delegate;

@property (assign, nonatomic) IBOutlet UITextField *name;
@property (assign, nonatomic) IBOutlet UITextField *quantity;
@property (assign, nonatomic) IBOutlet UIDatePicker *date;
@property (retain, nonatomic) NSMutableDictionary *selectedMaterial;

- (IBAction)save:(id)sender;

@end
