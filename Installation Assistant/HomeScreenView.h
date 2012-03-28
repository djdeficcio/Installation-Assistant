//
//  HomeScreenView.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 3/27/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomeScreen;

@interface HomeScreenView : UIView
{
    HomeScreen *parentController;
}

- (id)initWithFrame:(CGRect)frame andParentController:(HomeScreen *)parent;

@end
