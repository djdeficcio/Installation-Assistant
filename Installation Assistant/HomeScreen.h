//
//  HomeScreen.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 11/29/11.
//  Copyright (c) 2011 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomeScreenView;

@interface HomeScreen : UIViewController
{
    HomeScreenView *mainView;
}

- (void)loadProjectSelection;

@end
