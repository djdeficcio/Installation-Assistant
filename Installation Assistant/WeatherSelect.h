//
//  WeatherSelect.h
//  Installation Assistant
//
//  Created by Solular on 4/19/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WeatherSelect;

@protocol weatherSelectControllerDelegate <NSObject>

- (void)weatherSelectController:(WeatherSelect *)controller didSelectWeather:(NSString *)weather;

@end

@interface WeatherSelect : UITableViewController
{
    NSArray *weatherConditions;
    NSString *_selectedCondition;
}

@property (weak, nonatomic) id<weatherSelectControllerDelegate> delegate;
@property (retain, nonatomic) NSString *selectedCondition;



@end
