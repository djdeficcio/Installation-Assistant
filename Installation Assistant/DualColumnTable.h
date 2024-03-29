//
//  DualColumnTable.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 12/6/11.
//  Copyright (c) 2011 Solular, LLC. All rights reserved.
//
//  Used in the project information feature, displays a table layout using two columns.

#import <UIKit/UIKit.h>

@interface DualColumnTable : UIScrollView 
{
    NSInteger numberOfRows;
    NSInteger rowHeight;
}

- (id)initWithFrame:(CGRect)frame AndNumberOfRows:(NSInteger)rows WithRowHeight:(NSInteger)height;
- (void)populateCellsWithLabels:(NSArray *)labels AndValues:(NSMutableArray *)values;

@end
