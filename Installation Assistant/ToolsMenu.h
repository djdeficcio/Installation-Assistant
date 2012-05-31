//
//  ToolsMenu.h
//  Installation Assistant
//
//  Created by Solular on 5/9/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//
//  The view controller that controlls the tools menu. A very straightforward
//  tableview class.

#import <UIKit/UIKit.h>

@protocol ToolsMenuDelegate <NSObject>

- (void)toolsMenuToolSelected:(NSInteger)toolRow;

@end

@interface ToolsMenu : UITableViewController
{
    NSArray *tools;
    NSArray *icons;
}
@property (weak, nonatomic) id<ToolsMenuDelegate> delegate;

@end
