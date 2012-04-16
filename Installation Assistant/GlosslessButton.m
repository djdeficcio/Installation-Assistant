//
//  GlosslessButton.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 11/28/11.
//  Copyright (c) 2011 Solular, LLC. All rights reserved.
//

#import "GlosslessButton.h"
#import "Common.h"

@implementation GlosslessButton
@synthesize textLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {        
        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
        startColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        endColor = [UIColor colorWithRed:218.0/255.0 green:218.0/255.0 blue:218.0/255.0 alpha:1.0]; 
        
        
        textLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 3, frame.size.width - 10, frame.size.height - 10)];
        textLabel.numberOfLines = 1;
        textLabel.textAlignment = UITextAlignmentCenter;
        textLabel.backgroundColor = [UIColor clearColor];
        
        [self addSubview:textLabel];
    }
    return self;
}

- (void)setButtonStartColor:(UIColor *)gradientStartColor AndEndColor:(UIColor *)gradientEndColor AndBorderColor:(UIColor *)inputBorderColor
{
    startColor = gradientStartColor;
    endColor = gradientEndColor;
    borderColor = inputBorderColor;
    
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
//    CGFloat innerMargin = 3.0f;
//    CGRect innerRect = CGRectInset(outerRect, innerMargin, innerMargin);
//    CGMutablePathRef innerPath = createRoundedRectForRect(innerRect, 6.0);    
    
    //create the button gradient
    CGContextSaveGState(context);
    CGContextAddPath(context, outerPath);
    CGContextClip(context);
    drawLinearGradient(context, outerRect, startColor.CGColor, endColor.CGColor);
    //drawGlossAndGradient(context, outerRect, startColor, endColor);
    CGContextRestoreGState(context);
    
    if (self.state == UIControlStateHighlighted)
    {
        
        CGContextSaveGState(context);
        CGContextAddPath(context, outerPath);
        CGContextClip(context);
        drawLinearGradient(context, outerRect, endColor.CGColor, startColor.CGColor);
        CGContextRestoreGState(context);
    }
    
    //create the inner color outline
    CGContextSaveGState(context);
    CGContextAddPath(context, outerPath);
    CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
    CGContextSetLineWidth(context, 1.0);
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
