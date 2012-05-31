//
//  GlosslessButton.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 11/28/11.
//  Copyright (c) 2011 Solular, LLC. All rights reserved.
//
//  A glossless gradient-colored button based off of the Ray Wenderlich tutorial.

#import <UIKit/UIKit.h>

@interface GlosslessButton : UIButton
{
    UIColor *startColor;
    UIColor *endColor;
    UIColor *borderColor;
    UILabel *textLabel;
}
@property (retain) UILabel *textLabel;

- (void)setButtonStartColor:(UIColor *)gradientStartColor AndEndColor:(UIColor *)gradientEndColor AndBorderColor:(UIColor *)inputBorderColor;

@end
