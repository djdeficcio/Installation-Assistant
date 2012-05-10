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
