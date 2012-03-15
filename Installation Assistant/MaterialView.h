//
//  MaterialView.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 2/7/12.
//  Copyright 2012 Solular, LLC. All rights reserved.
//	File created using Singleton XCode Template by Mugunth Kumar (http://blog.mugunthkumar.com)
//  More information about this template on the post http://mk.sg/89
//  Permission granted to do anything, commercial/non-commercial with this file apart from removing the line/URL above

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>

@interface MaterialView : UIViewController <MFMailComposeViewControllerDelegate> 
{

}

+ (MaterialView *) sharedInstance;

- (void)openMail;

@end
