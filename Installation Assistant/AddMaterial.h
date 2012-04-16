//
//  AddMaterial.h
//  Installation Assistant
//
//  Created by Solular on 4/12/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddMaterial;

@protocol AddMaterialControllerDelegate <NSObject>

- (void)addMaterialControllerDidCancel:(AddMaterial *)controller;
- (void)addMaterialController:(AddMaterial *)controller didAddMaterial:(NSString *)materialName withQuantity:(NSString *)materialQuantity forDate:(NSDate *)materialDate;

@end

@interface AddMaterial : UIViewController

@property (weak, nonatomic) id <AddMaterialControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *quantity;
@property (strong, nonatomic) IBOutlet UIDatePicker *date;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

@end
