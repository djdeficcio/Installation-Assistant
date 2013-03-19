//
//  NotesViewCell.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 1/24/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "NotesViewCell.h"

@implementation NotesViewCell
@synthesize userLabel = _userLabel, dateLabel = _dateLabel, noteLabel = _noteLabel, noteID = _noteID;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
