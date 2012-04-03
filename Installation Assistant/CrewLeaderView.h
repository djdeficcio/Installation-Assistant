//
//  CrewLeaderView.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 3/29/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CrewLeader;

@interface CrewLeaderView : UIView
{
    CrewLeader *parentController;
}

- (void)animateEntrance;
- (void)animateExit;

- (id)initWithFrame:(CGRect)frame andParentController:(CrewLeader *)parent;

@end
