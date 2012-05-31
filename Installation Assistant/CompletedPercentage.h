//
//  CompletedPercentage.h
//  Installation Assistant
//
//  Created by Solular on 4/19/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//
//  The view controller for selected the completed percentage on the reports screen.
//  It declares a delegate method for saving the selected value back to the view controller
//  that called it.

#import <UIKit/UIKit.h>

@class CompletedPercentage;

@protocol completedPercentageControllerDelegate <NSObject>

- (void)completedPercentageController:(CompletedPercentage *)controller updatedWithValue:(NSString *)percentage;

@end

@interface CompletedPercentage : UITableViewController
{
    NSMutableArray *percentages;
    NSString *_currentPercent;
}

@property (weak, nonatomic) id<completedPercentageControllerDelegate> delegate;
@property (retain, nonatomic) NSString *currentPercent;
@property (strong, nonatomic) IBOutlet UITableView *percentTable;

@end
