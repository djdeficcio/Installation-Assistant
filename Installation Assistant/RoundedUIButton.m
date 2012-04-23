//
//  RoundedUIButton.m
//  Installation Assistant
//
//  Created by Solular on 4/20/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "RoundedUIButton.h"
#import "QuartzCore/QuartzCore.h"

@implementation RoundedUIButton

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.layer.cornerRadius = 10;
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.clipsToBounds = YES;
    }
    return self;
}

@end
