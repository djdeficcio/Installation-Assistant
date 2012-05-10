//
//  NotesViewCell.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 1/24/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

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
