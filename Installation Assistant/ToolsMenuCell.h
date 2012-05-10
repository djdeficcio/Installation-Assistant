//
//  ToolsMenuCell.h
//  Installation Assistant
//
//  Created by Solular on 5/10/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToolsMenuCell : UITableViewCell
{
    UIImageView *_icon;
    UILabel *_titleLabel;
}
@property (retain, nonatomic) UIImageView *icon;
@property (retain, nonatomic) UILabel *titleLabel;

@end
