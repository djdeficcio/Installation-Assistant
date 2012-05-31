//
//  MaterialListCell.h
//  Installation Assistant
//
//  Created by Solular on 4/12/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//
//  The cell used for the material lists.  Contains labels for the name, quantity ordered, and date requested for.

#import <UIKit/UIKit.h>

@interface MaterialListCell : UITableViewCell

@property (nonatomic, assign) IBOutlet UILabel *name;
@property (nonatomic, assign) IBOutlet UILabel *quantity;
@property (nonatomic, assign) IBOutlet UILabel *date;

@end
