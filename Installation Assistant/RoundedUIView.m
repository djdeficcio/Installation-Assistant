//
//  RoundedUIView.m
//  Installation Assistant
//
//  Created by Solular on 4/18/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "RoundedUIView.h"
#import "Quartzcore/Quartzcore.h"

@implementation RoundedUIView

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.layer.cornerRadius = 10;
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = 1;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
