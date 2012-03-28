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
        
        GlosslessButton *selectProjectButton = [[GlosslessButton alloc] initWithFrame:CGRectMake(200, 200, 200, 200)];
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
