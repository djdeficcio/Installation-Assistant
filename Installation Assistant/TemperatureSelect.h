//
//  TemperatureSelect.h
//  Installation Assistant
//
//  Created by Solular on 4/20/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//
//  Part of the reports feature, this is the view controller used for selecting the temperature.
//  It declares a protocol used to pass the selected temperature back to the view controller
//  that called it.

#import <UIKit/UIKit.h>

@class TemperatureSelect;

@protocol temperatureSelectControllerDelegate <NSObject>

- (void)temperatureSelectController:(TemperatureSelect *)controller didUpdateWithTemperature:(NSString *)temperature;

@end

@interface TemperatureSelect : UIViewController
{
    NSString *_selectedTemperature;
    
    UITextView *temperatureTextView;
}
@property (weak, nonatomic) id<temperatureSelectControllerDelegate> delegate;

@property (retain, nonatomic) NSString *selectedTemperature;

- (void)saveTemperature;

@end
