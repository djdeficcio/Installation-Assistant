//
//  CrewMembersView.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 4/2/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CrewMembers;

@interface CrewMembersView : UIView
{
    CrewMembers *parentController;
    UIView *dataView;
}

- (id)initWithFrame:(CGRect)frame andParentController:(CrewMembers *)parent;

- (void)animateEntrance;
- (void)animateExit;

@end
