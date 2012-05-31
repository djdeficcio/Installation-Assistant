//
//  NotesViewCell.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 1/24/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//
//  The cells used for the NotesView controllers.  They have a heading area at the top which contains the user
//  that created the note, as well as the date it was created.  The main body is made up of a single label
//  which displays the actual note text.

#import <UIKit/UIKit.h>

@interface NotesViewCell : UITableViewCell
{
    UILabel *_userLabel;
    UILabel *_dateLabel;
    UILabel *_noteLabel;
    NSString *_noteID;
}

@property (retain, nonatomic) IBOutlet UILabel *userLabel;
@property (retain, nonatomic) IBOutlet UILabel *dateLabel;
@property (retain, nonatomic) IBOutlet UILabel *noteLabel;
@property (retain, nonatomic) NSString *noteID;

@end
