//
//  NotesFullViewController.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 1/31/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//
//  Displays a single note in full view.
//  There's really not much to this class

#import <UIKit/UIKit.h>

@interface NotesFullViewController : UIViewController
{
    NSString *_enteredBy;
    NSString *_enterDate;
    NSString *_noteText;
}
@property (retain, nonatomic) NSString *enteredBy;
@property (retain, nonatomic) NSString *enterDate;
@property (retain, nonatomic) NSString *noteText;
@property (strong, nonatomic) IBOutlet UILabel *userLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UILabel *noteTextLabel;


@end
