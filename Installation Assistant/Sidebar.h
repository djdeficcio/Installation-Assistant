//
//  Sidebar.h
//  Installation Assistant
//
//  Created by DJ DeFiccio on 12/22/11.
//  Copyright 2011 Solular, LLC. All rights reserved.
//	File created using Singleton XCode Template by Mugunth Kumar (http://blog.mugunthkumar.com)
//  More information about this template on the post http://mk.sg/89
//  Permission granted to do anything, commercial/non-commercial with this file apart from removing the line/URL above

#import <Foundation/Foundation.h>
#import "CompassView.h"
#import "NotesView.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface Sidebar : UIViewController <UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate>
{
    UIViewController *parentController;
    UIView *sidebarView;
    UIView *parentView;
    NotesView *notesView;
    MFMailComposeViewController *materialView;
    MFMailComposeViewController *managerView;
    UITableView *table;
    NSMutableArray *icons;
    NSMutableArray *iconsPressed;
    NSMutableArray *cellContainer;
    NSMutableArray *iconContainer;
    BOOL compassDisplayed;
    BOOL notesDisplayed;
    BOOL materialsDisplayed;
    BOOL managersDisplayed;
}

+ (Sidebar *) sharedInstance:(UIViewController *)parent;
- (id)initWithParent:(UIViewController *)parent;
- (void)updateParent:(UIViewController *)parent;
- (UIView *) getSidebarView;
- (void) showSidebarAnimation;
- (void) hideSidebarAnimation;
- (void) selectedAnimation:(NSIndexPath *)indexPath;
- (void) closeSidebarWindows;
- (void) closeSidebarWindowsExcluding:(NSInteger)windowID;
- (void) presentMaterialView;
- (void) presentManagerView;

@end
