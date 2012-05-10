//
//  ToolsMenuCell.m
//  Installation Assistant
//
//  Created by Solular on 5/10/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "ToolsMenuCell.h"

@implementation ToolsMenuCell
@synthesize icon = _icon;
@synthesize titleLabel = _titleLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _icon = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 50, 50)];
        
        [self addSubview:_icon];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(55, 5, 145, 50)];
        _titleLabel.font = [UIFont boldSystemFontOfSize:22];
        _titleLabel.textAlignment = UITextAlignmentCenter;
        _titleLabel.textColor = [UIColor darkTextColor];
        
        [self addSubview:_titleLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
