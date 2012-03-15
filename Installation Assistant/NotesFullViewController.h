//
//  NotesFullViewController.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 1/31/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotesFullViewController : UIViewController
{
    UILabel *enteredBy;
    UILabel *enterDate;
    UILabel *noteText;
}

- (void)setFullNoteValues:(NSString *)noteValue enteredBy:(NSString *)userValue enteredOn:(NSString *)dateValue;

@end
