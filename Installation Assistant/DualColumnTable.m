//
//  DualColumnTable.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 12/6/11.
//  Copyright (c) 2011 Solular, LLC. All rights reserved.
//

#import "DualColumnTable.h"
#import "Quartzcore/Quartzcore.h"
#import "Common.h"
#import "DualColumnCell.h"

@implementation DualColumnTable

- (void)populateCellsWithLabels:(NSArray *)labels AndValues:(NSMutableArray *)values
{
    
    //Draw the cells in the first column
    for (int i=0; i<numberOfRows; i++)
    {
        DualColumnCell *cell = [[DualColumnCell alloc] initWithFrame:CGRectMake(0, rowHeight*i, self.frame.size.width/2, rowHeight)];
        [cell setLabelText:[labels objectAtIndex:i] AndValueText:[values objectAtIndex:i]];
         
        [self addSubview:cell];
    }
    
    //Draw the cells in the second column
    for (int i=numberOfRows; i<numberOfRows*2; i++)
    {
        DualColumnCell *cell = [[DualColumnCell alloc] initWithFrame:CGRectMake(self.frame.size.width/2, rowHeight*(i-numberOfRows), self.frame.size.width/2, rowHeight)];
        [cell setLabelText:[labels objectAtIndex:i] AndValueText:[values objectAtIndex:i]];
        [self addSubview:cell];
    }
}

- (id)initWithFrame:(CGRect)frame AndNumberOfRows:(NSInteger)rows WithRowHeight:(NSInteger)height
{
    
    self = [super initWithFrame:frame];
    if (self) 
    {
        
        numberOfRows = rows;
        
        rowHeight = height;
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 10;
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.contentSize = CGSizeMake(frame.size.width, rowHeight*numberOfRows);
        self.bounces = FALSE;
        
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 10;
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    NSLog(@"Draw Rect called");
    
    
}*/


@end
