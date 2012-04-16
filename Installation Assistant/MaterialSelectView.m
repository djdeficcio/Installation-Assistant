//
//  MaterialSelectView.m
//  Installation Assistant
//
//  Created by Solular on 4/11/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "MaterialSelectView.h"
#import "MaterialSelect.h"
#import "Quartzcore/Quartzcore.h"
#import "GlosslessButton.h"

@implementation MaterialSelectView

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

- (id)initWithFrame:(CGRect)frame andParentController:(MaterialSelect *)parent
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
        
        [self addSubview:dataView];
        
        GlosslessButton *close = [[GlosslessButton alloc] initWithFrame:CGRectMake(50, 600, 160, 80)];
        close.textLabel.text = @"Cancel";
        close.textLabel.font = [UIFont systemFontOfSize:24];
        [close addTarget:parentController action:@selector(removeSelf) forControlEvents:UIControlEventTouchDown];
        
        [dataView addSubview:close];
        
        GlosslessButton *confirm = [[GlosslessButton alloc] initWithFrame:CGRectMake(340, 600, 160, 80)];
        confirm.textLabel.text = @"Confirm";
        confirm.textLabel.font = [UIFont systemFontOfSize:24];
        [confirm addTarget:parentController action:@selector(confirmSelection) forControlEvents:UIControlEventTouchDown];
        
        [dataView addSubview:confirm];
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
