//
//  GlossyButton.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 11/17/11.
//  Copyright (c) 2011 Solular, LLC. All rights reserved.
//
//  A glossy glass-type button, based on the one presented in a tutorial by Ray Wenderlich.

#import <UIKit/UIKit.h>

@interface GlossyButton : UIButton
{
    UIColor *startColor;
    UIColor *endColor;
    UILabel *textLabel;
}
@property (retain) UILabel *textLabel;

- (void)setButtonStartColor:(UIColor *)gradientStartColor AndEndColor:(UIColor *)gradientEndColor;

@end
