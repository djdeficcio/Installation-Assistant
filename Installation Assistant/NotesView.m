//
//  NotesView.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 1/9/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "NotesView.h"
#import "Quartzcore/Quartzcore.h"
#import "GlosslessButton.h"
#import "NotesViewCell.h"
#import "ProjectData.h"
#import "HomeScreen.h"

static NotesView *_instance;
@implementation NotesView
@synthesize notes;

- (void)retrieveNotes:(NSString *)projectID
{
    NSString *urlString = [NSString stringWithFormat:@"http://173.61.46.253/ios/notesViewNoteRetrieval.php?id=%@", projectID];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSError *error;
    
    notes = (NSMutableArray *)[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    NSLog(@"%@", notes);
}

- (void)refreshNotes:(NSString *)projectID
{
    [self retrieveNotes:projectID];
    [noteTable reloadData];
    [notesView setNeedsDisplay];
}

- (void)hideNotesView
{
    [notesView removeFromSuperview];
}

- (UIView *)getNotesView
{    
    [self refreshNotes:[[ProjectData sharedInstance] projectID]];
    return notesView;
}

- (void)presentFullNote:(NSInteger)noteID
{
    if (fullNoteDisplayed == NO)
    {
        fullNoteView = [NotesFullViewController alloc];
        fullNoteView.view.frame = CGRectMake(550, 50, 550, 760);
        
        [fullNoteView setFullNoteValues:[[notes objectAtIndex:noteID] objectAtIndex:4] enteredBy:[[notes objectAtIndex:noteID] objectAtIndex:2] enteredOn:[[notes objectAtIndex:noteID] objectAtIndex:3]];
        
        [notesView addSubview:fullNoteView.view];
        
        fullNoteDisplayed = YES;
        
        [UIView animateWithDuration:.25 
                              delay:0.0 
                            options:UIViewAnimationCurveLinear 
                         animations:^{ fullNoteView.view.frame = CGRectMake(0, 50, fullNoteView.view.frame.size.width, fullNoteView.view.frame.size.height);}
                         completion:^(BOOL finished) {
                         }];
    }
}

- (void)hideFullNote
{
    [UIView animateWithDuration:.25 
                          delay:0.0 
                        options:UIViewAnimationCurveLinear 
                     animations:^{ fullNoteView.view.frame = CGRectMake(550, 50, fullNoteView.view.frame.size.width, fullNoteView.view.frame.size.height);}
                     completion:^(BOOL finished) {
                         [fullNoteView.view removeFromSuperview];
                         fullNoteDisplayed = NO;
                     }];
}

- (void)presentNewNote
{
    newNoteView = [[NotesNewViewController alloc] initWithNoteID:[notes count]];
    newNoteView.view.frame = CGRectMake(550, 50, 550, 760);
    
    [notesView addSubview:newNoteView.view];
    
    [UIView animateWithDuration:.25 
                          delay:0.0 
                        options:UIViewAnimationCurveLinear 
                     animations:^{ newNoteView.view.frame = CGRectMake(0, 50, newNoteView.view.frame.size.width, newNoteView.view.frame.size.height);}
                     completion:^(BOOL finished) {
                     }];
}

- (void)hideNewNote
{
    [UIView animateWithDuration:.25 
                          delay:0.0 
                        options:UIViewAnimationCurveLinear 
                     animations:^{ newNoteView.view.frame = CGRectMake(550, 50, newNoteView.view.frame.size.width, newNoteView.view.frame.size.height);}
                     completion:^(BOOL finished) {
                         [newNoteView.view removeFromSuperview];
                     }];
}

- (void)processSingleRightSwipe
{
    if (fullNoteDisplayed == YES)
    {
        [self hideFullNote];
    }
}

- (id)init
{
    self = [super init];
    
    if (self) {
    
        notes = [[NSMutableArray alloc] init];
        
        fullNoteDisplayed = NO;
        
        [self retrieveNotes:[[ProjectData sharedInstance] projectID]];
               
        notesView = [[UIView alloc] initWithFrame:CGRectMake(168, 50, 550, 760)];
            
        notesView.backgroundColor = [UIColor whiteColor];
        notesView.layer.cornerRadius = 10;
        notesView.layer.borderColor = [UIColor blackColor].CGColor;
        notesView.layer.borderWidth = 1;
        notesView.layer.masksToBounds = YES;

        cellContainer = [[NSMutableArray alloc] init];        
        
        menuBar = [[MenuBar alloc] initWithFrame:CGRectMake(0, 0, notesView.frame.size.width, 50)];
        [menuBar setGradientStartColor:[UIColor colorWithRed:187.0/255.0 green:230.0/255.0 blue:252.0/255.0 alpha:1.0] AndEndColor:[UIColor colorWithRed:134.0/255.0 green:212.0/255.0 blue:253.0/255.0 alpha:1.0]];
        
        GlosslessButton *newNote = [[GlosslessButton alloc] initWithFrame:CGRectMake(465, 5, 80, 40)];
        newNote.textLabel.text = @"New";
        newNote.textLabel.textColor = [UIColor blackColor];
        [newNote addTarget:self action:@selector(presentNewNote) forControlEvents:UIControlEventTouchDown];
        
        [menuBar addSubview:newNote];
        
        [notesView addSubview:menuBar];
        
        noteTable = [[UITableView alloc] initWithFrame:CGRectMake(0, menuBar.frame.size.height, notesView.frame.size.width, notesView.frame.size.height - 50) style:UITableViewStylePlain];


        noteTable.rowHeight = 150;
        noteTable.contentSize = CGSizeMake(notesView.frame.size.width, noteTable.rowHeight * [notes count]);
        noteTable.scrollEnabled = YES;
        
        noteTable.delegate = self;
        noteTable.dataSource = self;
        
        [notesView addSubview:noteTable];
        
        NSLog(@"Notes initialized!");
        
        UISwipeGestureRecognizer *swipeOneRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(hideFullNote)];
        
        swipeOneRight.numberOfTouchesRequired = 1;
        swipeOneRight.direction = UISwipeGestureRecognizerDirectionRight;
        [notesView addGestureRecognizer:swipeOneRight];
    
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark -
#pragma mark - Table Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [notes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NotesViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"Cell %i", indexPath.section]];
    
    if (cell == nil)
    {
        cell = [[NotesViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:[NSString stringWithFormat:@"Cell %i", indexPath.section]];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    
    cell.userLabel.text = [[notes objectAtIndex:indexPath.row] objectAtIndex:2];
    NSLog(@"%@", [[notes objectAtIndex:indexPath.row] objectAtIndex:3]);
    cell.dateLabel.text = [[notes objectAtIndex:indexPath.row] objectAtIndex:3];
    cell.noteLabel.text = [[notes objectAtIndex:indexPath.row] objectAtIndex:4];
    
    [cellContainer addObject:cell];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self presentFullNote:indexPath.row];
}

#pragma mark - Singleton Methods

+ (NotesView *)sharedInstance
{
    if (_instance == nil) 
    {
        _instance = [[super allocWithZone:NULL] init];
    }
    
    
    
    return _instance;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

@end
