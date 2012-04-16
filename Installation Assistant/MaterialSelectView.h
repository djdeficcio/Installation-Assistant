//
//  MaterialSelectView.h
//  Installation Assistant
//
//  Created by Solular on 4/11/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MaterialSelect;

@interface MaterialSelectView : UIView
{
    MaterialSelect *parentController;
    UIView *dataView;
}

- (id)initWithFrame:(CGRect)frame andParentController:(MaterialSelect *)parent;
- (void)animateEntrance;
- (void)animateExit;



@end
