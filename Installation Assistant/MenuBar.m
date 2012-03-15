//
//  TopMenuBar.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 11/28/11.
//  Copyright (c) 2011 Solular, LLC. All rights reserved.
//

#import "MenuBar.h"
#import "Common.h"

@implementation MenuBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        startColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1];
        endColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:.8];
        
        
    }
    return self;
}

- (void)setGradientStartColor:(UIColor *)gradientStartColor AndEndColor:(UIColor *)gradientEndColor
{
    startColor = gradientStartColor;
    endColor = gradientEndColor;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor *shadowColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.5];

    CGContextSetShadowWithColor(context, CGSizeMake(0, 2), 3.0, shadowColor.CGColor);
    drawLinearGradient(context, self.bounds, startColor.CGColor, endColor.CGColor);

}


@end
