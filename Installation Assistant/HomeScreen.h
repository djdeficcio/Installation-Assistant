//
//  HomeScreen.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 11/29/11.
//  Copyright (c) 2011 Solular, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeScreen : UIViewController
{
    
}
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;

- (IBAction)login:(id)sender;
- (void)verifyLogin:(NSString *)usernameI withPassword:(NSString *)passwordI;

@end
