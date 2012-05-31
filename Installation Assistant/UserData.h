//
//  UserData.h
//  Installation Assistant
//
//  Created by Solular on 5/7/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//
//  This singleton contains information about the currently logged in user.

#import <Foundation/Foundation.h>

@interface UserData : NSObject
{
    NSString *_username;
    NSString *_firstname;
    NSString *_lastname;
    NSString *_ctid;
}
@property (readonly, strong, nonatomic) NSString *username;
@property (readonly, strong, nonatomic) NSString *firstname;
@property (readonly, strong, nonatomic) NSString *lastname;
@property (readonly, strong, nonatomic) NSString *ctid;

+ (UserData *)sharedInstance;
- (void)assignUsername:(NSString *)username withFirstName:(NSString *)firstname andLastName:(NSString *)lastname andCtid:(NSString *)ctid;



@end
