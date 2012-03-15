//
//  NotesView.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 1/9/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuBar.h"
#import "NotesFullViewController.h"
#import "NotesNewViewController.h"

@interface NotesView : UIViewController <UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate>
{
    UIView *notesView;
    NotesFullViewController *fullNoteView;
    NotesNewViewController *newNoteView;
    MenuBar *menuBar;
    NSMutableArray *cellContainer;
    NSMutableArray *notes;
    UITableView *noteTable;
    BOOL fullNoteDisplayed;
}
@property (retain) NSMutableArray *notes;

+ (NotesView *)sharedInstance;

- (void)retrieveNotes:(NSString *)projectID;
- (void)refreshNotes:(NSString *)projectID;
- (UIView *)getNotesView;
- (void)hideNotesView;
- (void)presentFullNote:(NSInteger)noteID;
- (void)hideFullNote;
- (void)processSingleRightSwipe;
- (void)presentNewNote;
- (void)hideNewNote;

@end
