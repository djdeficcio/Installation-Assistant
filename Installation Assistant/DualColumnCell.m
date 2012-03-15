//
//  DualColumnCell.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 12/7/11.
//  Copyright (c) 2011 Solular, LLC. All rights reserved.
//

#import "DualColumnCell.h"
#import "Common.h"
#import "Quartzcore/Quartzcore.h"

@implementation DualColumnCell

- (void)setLabelText:(NSString *)labelText AndValueText:(NSString *)valueText
{
    label.text = labelText;
    
    value.text = valueText;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = .5;
        
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width*.4, frame.size.height)];
        label.text = @"Label:";
        label.textAlignment = UITextAlignmentCenter;
        label.textColor = [UIColor grayColor];
        label.font = [UIFont boldSystemFontOfSize:18.0];
        label.numberOfLines = 0;
                
        [self addSubview:label];
        
        value = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width*.4, 0, frame.size.width*.55, frame.size.height)];
        value.text = @"Value";
        value.textAlignment = UITextAlignmentCenter;
        value.font = [UIFont systemFontOfSize:20.0];
        value.numberOfLines = 0;
        value.lineBreakMode = UILineBreakModeWordWrap;
                
        [self addSubview:value];
    }
    return self;
}




// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGPoint bottomLeft = CGPointMake(0, rect.size.height);
    CGPoint bottomRight = CGPointMake(rect.size.width, rect.size.height);
    
    draw1PxStroke(context, bottomLeft, bottomRight, [UIColor grayColor].CGColor);
}


@end
