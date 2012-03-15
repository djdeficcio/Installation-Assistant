//
//  NotesViewCell.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 1/24/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "NotesViewCell.h"
#import "MenuBar.h"

@implementation NotesViewCell
@synthesize userLabel, dateLabel, noteLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       
        MenuBar *heading = [[MenuBar alloc] initWithFrame:CGRectMake(0, 0, 550, 25)];
        
        userLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 2.5, 200, 20)];
        userLabel.numberOfLines = 0;
        userLabel.backgroundColor = [UIColor clearColor];
        
        [heading addSubview:userLabel];
        
        dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(290, 2.5, 250, 20)];
        dateLabel.numberOfLines = 0;
        dateLabel.backgroundColor = [UIColor clearColor];
        dateLabel.textAlignment = UITextAlignmentRight;
        
        [heading addSubview:dateLabel];
        
        [self addSubview:heading];
        
        noteLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 45, 510, 85)];
        noteLabel.numberOfLines = 0;
        noteLabel.backgroundColor = [UIColor clearColor];
        noteLabel.textAlignment = UITextAlignmentLeft;
        
        [self addSubview:noteLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
