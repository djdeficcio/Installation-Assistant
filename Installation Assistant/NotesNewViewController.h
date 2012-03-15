//
//  NotesNewViewController.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 2/3/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotesNewViewController : UIViewController
{
    UILabel *userLabel;
    UILabel *dateLabel;
    UITextView *noteText;
    NSString *user;
    NSString *date;
    NSString *noteID;
    NSString *projectID;
    NSString *noteContents;
}

- (id)initWithNoteID:(int)ID;

- (NSString *)getUser;
- (NSString *)getDate;
- (void)cancelNewNote;
- (void)saveNewNote;

@end
