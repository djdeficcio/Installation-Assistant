//
//  NotesView.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 1/9/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//
//  The view controller used for showing the list of notes for the current project.
//  Allows the user to either view a note in full or create a new note.

#import <UIKit/UIKit.h>
#import "NotesFullViewController.h"
#import "NotesNewViewController.h"

@interface NotesView : UITableViewController <UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate>
{
    NSArray *_notes;
    NSIndexPath *selectedNotePath;
}
@property (retain, nonatomic) NSArray *notes;

- (IBAction)close:(id)sender;
- (void)retrieveNotes:(NSString *)projectID;
- (void)refreshNotes:(NSString *)projectID;
@end
