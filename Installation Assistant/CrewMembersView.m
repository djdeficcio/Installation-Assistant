//
//  CrewMembersView.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 4/2/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "CrewMembersView.h"
#import "CrewMembers.h"
#import "Quartzcore/Quartzcore.h"
#import "GlosslessButton.h"

@implementation CrewMembersView

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

- (id)initWithFrame:(CGRect)frame andParentController:(CrewMembers *)parent
{
    self = [super initWithFrame:frame];
    if (self) {
        parentController = parent;
        
        self.backgroundColor = [UIColor whiteColor];
        
        UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(50, 50, 450, 500) style:UITableViewStylePlain];
        table.layer.cornerRadius = 10;
        table.layer.borderColor = [UIColor blackColor].CGColor;
        table.layer.borderWidth = 1;
        table.allowsMultipleSelection = YES;
        table.delegate = parentController;
        table.dataSource = parentController;
        
        [self addSubview:table];
        
        GlosslessButton *close = [[GlosslessButton alloc] initWithFrame:CGRectMake(50, 600, 160, 80)];
        close.textLabel.text = @"Cancel";
        close.textLabel.font = [UIFont systemFontOfSize:24];
        [close addTarget:parentController action:@selector(removeSelf) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:close];
        
        GlosslessButton *confirm = [[GlosslessButton alloc] initWithFrame:CGRectMake(340, 600, 160, 80)];
        confirm.textLabel.text = @"Confirm";
        confirm.textLabel.font = [UIFont systemFontOfSize:24];
        [confirm addTarget:parentController action:@selector(confirmSelection) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:confirm];
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
