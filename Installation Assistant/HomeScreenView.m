//
//  HomeScreenView.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 3/27/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "HomeScreenView.h"
#import "HomeScreen.h"
#import "GlosslessButton.h"

@implementation HomeScreenView

- (id)initWithFrame:(CGRect)frame andParentController:(HomeScreen *)parent
{
    self = [super initWithFrame:frame];
    if (self) {
        
        parentController = parent;
        
        parentController.navigationItem.backBarButtonItem.title = @"Home";
        
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *appTitle = [[UILabel alloc] initWithFrame:CGRectMake(159, 250, 450, 150)];
        appTitle.backgroundColor = [UIColor clearColor];
        appTitle.text = @"Field Tech";
        appTitle.textAlignment = UITextAlignmentCenter;
        appTitle.font = [UIFont systemFontOfSize:60];
        
        [self addSubview:appTitle];
        
        UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"solular logo.png"]];
        logo.frame = CGRectMake(209, 25, 350, 193);
        
        [self addSubview:logo];
        
        GlosslessButton *selectProjectButton = [[GlosslessButton alloc] initWithFrame:CGRectMake(184, 500, 400, 150)];
        selectProjectButton.textLabel.text = @"Select a Project";
        selectProjectButton.textLabel.font = [UIFont systemFontOfSize:34];
        [selectProjectButton addTarget:parentController action:@selector(loadProjectSelection) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:selectProjectButton];
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
