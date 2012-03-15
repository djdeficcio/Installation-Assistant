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
    UILabel *userLabel;
    UILabel *dateLabel;
    UILabel *noteLabel;
}

@property (retain) UILabel *userLabel;
@property (retain) UILabel *dateLabel;
@property (retain) UILabel *noteLabel;

@end
