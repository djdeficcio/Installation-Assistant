//
//  LocationServicesView.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 3/19/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "LocationServicesView.h"
#import "Quartzcore/Quartzcore.h"

@implementation LocationServicesView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = 1;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 10;
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
