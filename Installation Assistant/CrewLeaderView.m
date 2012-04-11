//
//  CrewLeaderView.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 3/29/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "CrewLeaderView.h"
#import "CrewLeader.h"
#import "Quartzcore/Quartzcore.h"
#import "GlosslessButton.h"

@implementation CrewLeaderView

- (void)animateEntrance
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    NSInteger targetY = (screenBounds.size.height - dataView.frame.size.height)/4;
    [UIView animateWithDuration:0.25 
                     animations:^{
                         dataView.frame = CGRectMake(dataView.frame.origin.x, targetY + 10, dataView.frame.size.width, dataView.frame.size.height);
                     }];
}

- (void)animateExit
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    [UIView animateWithDuration:0.25
                     animations:^{
                         dataView.frame = CGRectMake(dataView.frame.origin.x, screenBounds.size.height, dataView.frame.size.width, dataView.frame.size.height);
                     }
                     completion:^(BOOL finished){
                         [[parentController view] removeFromSuperview];
                     }];
}

- (id)initWithFrame:(CGRect)frame andParentController:(CrewLeader *)parent
{
    self = [super initWithFrame:frame];
    if (self) {
        parentController = parent;
        
        self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
        
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        NSInteger dataViewWidth = 550;
        NSInteger dataViewX = (screenBounds.size.width - dataViewWidth)/2;
        
        dataView = [[UIView alloc] initWithFrame:CGRectMake(dataViewX, frame.size.height, dataViewWidth, 710)];
        dataView.layer.borderColor = [UIColor blackColor].CGColor;
        dataView.layer.borderWidth = 1;
        dataView.backgroundColor = [UIColor whiteColor];
        dataView.layer.cornerRadius = 10;
        dataView.layer.masksToBounds = YES;
        
        UITableView *leaderPool = [[UITableView alloc] initWithFrame:CGRectMake(50, 50, 450, 500) style:UITableViewStylePlain];
        leaderPool.layer.cornerRadius = 10;
        leaderPool.layer.borderColor = [UIColor blackColor].CGColor;
        leaderPool.layer.borderWidth = 1;
        leaderPool.backgroundColor = [UIColor clearColor];
        leaderPool.delegate = parentController;
        leaderPool.dataSource = parentController;
        
        [dataView addSubview:leaderPool];
        
        GlosslessButton *cancelButton = [[GlosslessButton alloc] initWithFrame:CGRectMake(50, 600, 160, 80)];
        cancelButton.textLabel.text = @"Cancel";
        cancelButton.textLabel.font = [UIFont systemFontOfSize:24];
        [cancelButton addTarget:parentController action:@selector(removeSelf) forControlEvents:UIControlEventTouchDown];
               
        [dataView addSubview:cancelButton];
        
        GlosslessButton *confirmButton = [[GlosslessButton alloc] initWithFrame:CGRectMake(340, 600, 160, 80)];
        confirmButton.textLabel.text = @"Confirm";
        confirmButton.textLabel.font = [UIFont systemFontOfSize:24];
        [confirmButton addTarget:parentController action:@selector(confirmSelection) forControlEvents:UIControlEventTouchDown];
        
        [dataView addSubview:confirmButton];
        
        [self addSubview:dataView];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
