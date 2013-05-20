//
//  CHHoursViewController.m
//  CompanyHours
//
//  Created by Jesus Morales on 5/17/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import "CHHoursViewController.h"
#import "CHShiftViewController.h"

@interface CHHoursViewController ()

@end

@implementation CHHoursViewController

@synthesize shifts = _shifts;
@synthesize worker = _worker;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        //JM set the NavigationItem title property of this view controller to have the Workers title
        UINavigationItem *navItem = [self navigationItem];
        
        [navItem setTitle:@"Shifts"];
        
        //JM create a button object and assign it to the right button property of the uinavigationbar
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addShift:)];
        [navItem setRightBarButtonItem:bbi animated:YES];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

-(IBAction)addShift:(id)sender
{
    NSString *worker = self.worker.workerName;
    
    CHAddShiftViewController *addShiftViewController = [[CHAddShiftViewController alloc] initWithWorkerName:worker];
    addShiftViewController.delegate = self;
    
    [self.navigationController pushViewController:addShiftViewController animated:YES];
}

-(void)addShiftConfirm:(CHShift *)s
{
    [self.worker.workerShifts addObject:s];
    
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
    return [[[self worker] workerShifts] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CHHoursViewCell"];
#warning I think I'm just creating infinite cells check the initial view controller too
    CHShift *shiftToBeDisplayed = [self.worker.workerShifts objectAtIndex:indexPath.row];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd"];
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"%.02f hrs", shiftToBeDisplayed.shiftDuration]];
    [cell.textLabel setText:[dateFormatter stringFromDate:shiftToBeDisplayed.shiftDate]];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CHShift *shiftToBePassed = [self.worker.workerShifts objectAtIndex:indexPath.row];
    CHShiftViewController *shiftViewController = [[CHShiftViewController alloc] initWithShift:shiftToBePassed];
    [self.navigationController pushViewController:shiftViewController animated:YES];
}

@end
