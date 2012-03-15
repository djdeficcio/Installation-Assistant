//
//  ViewController.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 11/9/11.
//  Copyright (c) 2011 Solular, LLC. All rights reserved.
//


#define serverQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
//#define requestProjects [NSURL URLWithString:@"http://10.1.10.190/ios/retrieveProjects.php"]
#define requestProjects [NSURL URLWithString:@"http://173.61.46.253/ios/retrieveProjects.php"]
#define requestProjectData [NSURL URLWithString:@"http://173.61.46.253/ios/retrieveProjectData.php"]

#import <UIKit/UIKit.h>

@interface ProjectSelection : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *projects;
    NSMutableArray *cells;
    UITableView *projectTable;
}

- (void)loadProjectNames;
- (void)processProjectNames:(NSData *)responseData;
- (void)loadProjectData:(NSInteger)projectRow;
- (void)processProjectData:(NSData *)responseData;
@end
