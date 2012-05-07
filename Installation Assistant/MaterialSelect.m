//
//  MaterialSelect.m
//  Installation Assistant
//
//  Created by Solular on 4/11/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "MaterialSelect.h"
#import "MaterialList.h"
#import "MaterialListCell.h"

@implementation MaterialSelect
@synthesize delegate, materials = _materials;

#pragma IB Actions

- (IBAction)cancel:(id)sender
{
    [self.delegate materialSelectControllerDidCancel:self];
}

- (IBAction)done:(id)sender
{
    [self.delegate materialSelectController:self updatedWithMaterials:_materials];
}

#pragma mark - Add Material Delegate Methods

- (void)addMaterialControllerDidCancel:(AddMaterial *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addMaterialController:(AddMaterial *)controller didAddMaterial:(NSString *)materialName withQuantity:(NSString *)materialQuantity forDate:(NSDate *)materialDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSMutableDictionary *materialEntry = [NSMutableDictionary dictionaryWithObjectsAndKeys:materialName, @"name", materialQuantity, @"quantity", [dateFormatter stringFromDate:materialDate], @"date", nil];
    [_materials addObject:materialEntry];
        
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[_materials count] -1 inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Edit Material Delegate Methods

- (void)editMaterialControllerDidCancel:(EditMaterial *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)editMaterialController:(EditMaterial *)controller updatedMaterial:(NSString *)materialName withQuantity:(NSString *)materialQuantity forDate:(NSDate *)materialDate atRow:(NSIndexPath *)indexPath
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSMutableDictionary *materialEntry = [NSMutableDictionary dictionaryWithObjectsAndKeys:materialName, @"name", materialQuantity, @"quantity", [dateFormatter stringFromDate:materialDate], @"date", nil];
    [_materials replaceObjectAtIndex:indexPath.row withObject:materialEntry];
        
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationTop];
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_materials count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    MaterialListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MaterialCell"];
    
    
    if (indexPath.row == [_materials count]) 
    {
        cell.name.text = @"New Material";
        cell.quantity.text = @"Quantity";
        cell.date.text = @"Date Needed";
    }
    
    else 
    {
        cell.name.text = [[_materials objectAtIndex:indexPath.row] objectForKey:@"name"];
        cell.quantity.text = [[_materials objectAtIndex:indexPath.row] objectForKey:@"quantity"];
        cell.date.text = [[_materials objectAtIndex:indexPath.row] objectForKey:@"date"];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == [_materials count])
    {
        [self performSegueWithIdentifier:@"AddMaterial" sender:self];
    }
    
    else
    {
        selectedMaterial = [NSDictionary dictionaryWithObjectsAndKeys:indexPath, @"indexpath", [[_materials objectAtIndex:indexPath.row] objectForKey:@"name"], @"name", [[_materials objectAtIndex:indexPath.row] objectForKey:@"quantity"], @"quantity", [[_materials objectAtIndex:indexPath.row] objectForKey:@"date"], @"date", nil];
        
        [self performSegueWithIdentifier:@"EditMaterial" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddMaterial"])
    {
        AddMaterial *addMaterialController = segue.destinationViewController;

        addMaterialController.delegate = self;
    }
    
    if ([segue.identifier isEqualToString:@"EditMaterial"])
    {
        EditMaterial *editMaterialController = segue.destinationViewController;
        
        editMaterialController.delegate = self;
        editMaterialController.selectedMaterial = selectedMaterial;
        
    }
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        selectedMaterial = [[NSMutableDictionary alloc] init];
    }
    return self;
}



- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (_materials == nil)
    {
        _materials = [[NSMutableArray alloc] init];
    }
}


- (void)viewDidUnload
{
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
