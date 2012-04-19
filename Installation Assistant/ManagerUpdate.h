//
//  ManagerUpdate.h
//  Installation Assistant
//
//  Created by Solular on 4/19/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ManagerUpdate;

@protocol managerUpdateControllerDelegate <NSObject>

- (void)managerUpdateControllerDidCancel:(ManagerUpdate *)controller;
- (void)managerUpdateController:(ManagerUpdate *)controller didSaveMessage:(NSString *)message;

@end

@interface ManagerUpdate : UIViewController

@property (weak, nonatomic) id<managerUpdateControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextView *updateTextView;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end
