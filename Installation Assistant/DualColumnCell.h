//
//  DualColumnCell.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 12/7/11.
//  Copyright (c) 2011 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DualColumnCell : UIView
{
    UILabel *label;
    UILabel *value;
}

- (void)setLabelText:(NSString *)labelText AndValueText:(NSString *)valueText;

@end
