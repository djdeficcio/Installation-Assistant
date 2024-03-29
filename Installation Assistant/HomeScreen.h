//
//  HomeScreen.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 11/29/11.
//  Copyright (c) 2011 Solular, LLC. All rights reserved.
//
//  This is the app's home screen.  It uses Core Data to provide a 
//  network agnostic way of logging in.  The user information stored is also
//  used as a replacement for Device ID's, since Apple felt the need to get
//  rid of those.

#import <UIKit/UIKit.h>

@interface HomeScreen : UIViewController
{
    
}
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;

- (IBAction)login:(id)sender;
- (void)verifyLogin:(NSString *)usernameI withPassword:(NSString *)passwordI;

@end
