//
//  NotesView.m
//  Installation Assistant
//
//  Created by DJ DeFiccio on 1/9/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "NotesView.h"
#import "NotesViewCell.h"
#import "NotesFullViewController.h"
#import "NotesNewViewController.h"
#import "ProjectData.h"
#import "DBGateway.h"

@implementation NotesView
@synthesize notes = _notes;

- (IBAction)close:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (void)retrieveNotes:(NSString *)projectID
{    
    DBGateway *gateway = [[DBGateway alloc] init];
    
    _notes = [gateway getNotesForProject:projectID];
    
    NSLog(@"Notes: %@", _notes);
}

- (void)refreshNotes:(NSString *)projectID
{
    [self retrieveNotes:projectID];
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"NewNote"]) {
        NotesNewViewController *controller = segue.destinationViewController;
        controller.noteID = [NSString stringWithFormat:@"%d", [_notes count]];
    }
    
    if ([segue.identifier isEqualToString:@"FullNote"]) {
        NotesFullViewController *controller = segue.destinationViewController;
        NotesViewCell *cell = (NotesViewCell *)[self.tableView cellForRowAtIndexPath:selectedNotePath];
        controller.enteredBy = cell.userLabel.text;
        controller.enterDate = cell.dateLabel.text;
        controller.noteText = cell.noteLabel.text;
    }
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
    
        _notes = [[NSArray alloc] init];
                
    }
    
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [self refreshNotes:[[ProjectData sharedInstance] projectID]];
}

#pragma mark -
#pragma mark - Table Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_notes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NotesViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil)
    {
        cell = [[NotesViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    
    cell.userLabel.text = [[_notes objectAtIndex:indexPath.row] objectForKey:@"entered_by"];
    cell.dateLabel.text = [[_notes objectAtIndex:indexPath.row] objectForKey:@"entry_date"];
    cell.noteLabel.text = [[_notes objectAtIndex:indexPath.row] objectForKey:@"note_text"];
    cell.noteID = [[_notes objectAtIndex:indexPath.row] objectForKey:@"note_id"];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    selectedNotePath = indexPath;
    [self performSegueWithIdentifier:@"FullNote" sender:self];
}

@end
