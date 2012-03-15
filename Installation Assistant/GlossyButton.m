//
//  GlossyButton.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 11/17/11.
//  Copyright (c) 2011 Solular, LLC. All rights reserved.
//

#import "GlossyButton.h"
#import "Common.h"

@implementation GlossyButton
@synthesize textLabel;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
            
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
        startColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1];
        endColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:.8];
        
        textLabel = [[UILabel alloc] initWithFrame:frame];
        textLabel.numberOfLines = 1;
        textLabel.textAlignment = UITextAlignmentCenter;
    }
    
    return self;
}

- (void)setButtonStartColor:(UIColor *)gradientStartColor AndEndColor:(UIColor *)gradientEndColor
{
    startColor = gradientStartColor;
    endColor = gradientEndColor;
    
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //create the outer path
    CGFloat outerMargin = 5.0f;
    CGRect outerRect = CGRectInset(self.bounds, outerMargin, outerMargin);
    CGMutablePathRef outerPath = createRoundedRectForRect(outerRect, 6.0);
    
    //create the inner path
    CGFloat innerMargin = 3.0f;
    CGRect innerRect = CGRectInset(outerRect, innerMargin, innerMargin);
    CGMutablePathRef innerPath = createRoundedRectForRect(innerRect, 6.0);
    
    if (self.state != UIControlStateHighlighted)
    {
        CGContextSaveGState(context);
        //CGContextSetShadowWithColor(context, CGSizeMake(0, 2), 3.0, shadowColor.CGColor);
        CGContextAddPath(context, outerPath);
        //CGContextFillPath(context);
        CGContextRestoreGState(context);
        
    }
    
    
    //create the button gradient
    CGContextSaveGState(context);
    CGContextAddPath(context, outerPath);
    CGContextClip(context);
    drawGlossAndGradient(context, outerRect, startColor, endColor);
    CGContextRestoreGState(context);
    
    if (self.state == UIControlStateHighlighted)
    {
        
        CGContextSaveGState(context);
        CGContextAddPath(context, innerPath);
        CGContextClip(context);
        //drawLinearGradient(context, innerRect, highlightStart.CGColor, highlightStop.CGColor);
           
        
        //Draw the gray Gradient
        
        CGFloat BGLocations[2] = { 0.0, 1.0 };
        CGFloat BgComponents[8] = { 1.0, 1.0, 1.0 , 1.0,  // Start color
            1.0, 1.0, 1.0, 0.1 }; // Mid color and End color
        CGColorSpaceRef BgRGBColorspace = CGColorSpaceCreateDeviceRGB();
        CGGradientRef bgRadialGradient = CGGradientCreateWithColorComponents(BgRGBColorspace, BgComponents, BGLocations, 2);
        
        
        CGPoint startBg = CGPointMake((innerRect.size.width / 2) + (outerMargin * 2), (innerRect.size.height / 2) + (outerMargin * 2)); 
        CGFloat endRadius= innerRect.size.width / 2;
        
        
        CGContextDrawRadialGradient(context, bgRadialGradient, startBg, 0, startBg, endRadius, kCGGradientDrawsAfterEndLocation);
        CGColorSpaceRelease(BgRGBColorspace);
        CGGradientRelease(bgRadialGradient);
        
        CGContextRestoreGState(context);
    }
    
    //create the inner color outline
    CGContextSaveGState(context);
    CGContextAddPath(context, outerPath);
    CGContextSetStrokeColorWithColor(context, startColor.CGColor);
    CGContextSetLineWidth(context, 2.0);
    CGContextStrokePath(context);
    CGContextRestoreGState(context);

}

- (void)hesitateUpdate
{
    [self setNeedsDisplay];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    [self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    [self setNeedsDisplay];
    [self performSelector:@selector(hesitateUpdate) withObject:nil afterDelay:0.1];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [self setNeedsDisplay];
    [self performSelector:@selector(hesitateUpdate) withObject:nil afterDelay:0.1];
}

@end
