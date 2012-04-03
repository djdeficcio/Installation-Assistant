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
    [UIView animateWithDuration:0.25
                     animations:^{
                         self.frame = CGRectMake(0, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
                     }];
}

- (void)animateExit
{
    [UIView animateWithDuration:0.25
                     animations:^{
                         self.frame = CGRectMake(550, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
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
        self.backgroundColor = [UIColor whiteColor];
        
        UITableView *leaderPool = [[UITableView alloc] initWithFrame:CGRectMake(50, 50, 450, 500) style:UITableViewStylePlain];
        leaderPool.layer.cornerRadius = 10;
        leaderPool.layer.borderColor = [UIColor blackColor].CGColor;
        leaderPool.layer.borderWidth = 1;
        leaderPool.backgroundColor = [UIColor clearColor];
        leaderPool.delegate = parentController;
        leaderPool.dataSource = parentController;
        
        [self addSubview:leaderPool];
        
        GlosslessButton *cancelButton = [[GlosslessButton alloc] initWithFrame:CGRectMake(50, 600, 160, 80)];
        cancelButton.textLabel.text = @"Cancel";
        cancelButton.textLabel.font = [UIFont systemFontOfSize:24];
        [cancelButton addTarget:parentController action:@selector(removeSelf) forControlEvents:UIControlEventTouchDown];
               
        [self addSubview:cancelButton];
        
        GlosslessButton *confirmButton = [[GlosslessButton alloc] initWithFrame:CGRectMake(340, 600, 160, 80)];
        confirmButton.textLabel.text = @"Confirm";
        confirmButton.textLabel.font = [UIFont systemFontOfSize:24];
        [confirmButton addTarget:parentController action:@selector(confirmSelection) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:confirmButton];
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
