//
//  TopMenuBar.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 11/28/11.
//  Copyright (c) 2011 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuBar : UIView
{
    UIColor *startColor;
    UIColor *endColor;
    UILabel *_title;
}
@property (retain) UILabel *title;

- (void)setGradientStartColor:(UIColor *)gradientStartColor AndEndColor:(UIColor *)gradientEndColor;


@end
