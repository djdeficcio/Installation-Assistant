//
//  LocationServicesView.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 3/19/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LocationView;

@interface LocationServicesView : UIView
{
    LocationView *parentController;
    UIView *locationInfo;
    UILabel *_location;
}
@property (retain) UILabel *location;

- (id)initWithFrame:(CGRect)frame andParentController:(LocationView *)parent;

- (void)refreshLocationAnimation;

@end
