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
    UITextView *noteText;
    NSString *user;
    NSString *date;
    NSString *_noteID;
    NSString *projectID;
    NSString *noteContents;
    NSString *deviceName;
    NSString *userID;
    
}
@property (strong, nonatomic) IBOutlet UILabel *userLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UITextView *noteText;
@property (retain, nonatomic) NSString *noteID;

- (IBAction)save:(id)sender;
- (NSString *)getUser;
- (NSString *)getDate;
- (void)saveNewNote;

@end
