//
//  UpdateClient.h
//  Installation Assistant
//
//  Created by Solular on 4/20/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UpdateClient;

@protocol updateClientControllerDelegate <NSObject>

- (void)updateClientControllerDidCancel:(UpdateClient *)controller;
- (void)updateClientController:(UpdateClient *)controller didUpdateCustomer:(NSInteger)updated withNotes:(NSString *)notes;

@end

@interface UpdateClient : UIViewController
{
    NSInteger _updatedIndex;
    NSString *_updatedNotes;
}
@property (weak, nonatomic) id <updateClientControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UISegmentedControl *updatedControl;
@property (strong, nonatomic) IBOutlet UITextView *notesTextView;

@property (assign, nonatomic) NSInteger updatedIndex;
@property (retain, nonatomic) NSString *updatedNotes;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end
