//
//  CHInitialViewController.m
//  CompanyHours
//
//  Created by Jesus Morales on 5/16/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import "CHInitialViewController.h"
#import "CHWorker.h"
#import "CHAddWorkerViewController.h"
#import "CHHoursViewController.h"
#import "CHHoursViewController.h"

@interface CHInitialViewController ()

@end

@implementation CHInitialViewController

@synthesize workersArray = _workersArray;

-(id)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self)
    {
        //JM set the NavigationItem title property of this view controller to have the Workers title
        UINavigationItem *navItem = [self navigationItem];
        
        [navItem setTitle:@"Workers"];
        
        //JM create a button object and assign it to the right button property of the uinavigationbar
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addWorker:)];
        [navItem setRightBarButtonItem:bbi animated:YES];
        
        _workersArray = [NSMutableArray array];
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    //JM rerouting this initWithStyle method to the init method
    return [self init];
}

//JM
-(IBAction)addWorker:(id)sender
{
    //JM create an AddWorkerViewController to pass to the navigationController
    CHAddWorkerViewController *addWorkerViewController = [[CHAddWorkerViewController alloc] init];
    
    addWorkerViewController.delegate = self;
    
    //JM Push it to the top of the navigation controller's stack
    [[self navigationController] pushViewController:addWorkerViewController animated:YES];
}

-(void)addWorkerConfirm:(CHWorker *)w
{
    [self.workersArray addObject:w];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self workersArray] count];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self tableView] reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CHInitialViewCell"];
    
    CHWorker *workerToBeDisplayed = [self.workersArray objectAtIndex:indexPath.row];
    
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"%.02f",[workerToBeDisplayed getTotalHours]]];
    [cell.textLabel setText:workerToBeDisplayed.workerName];
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
    // Navigation logic may go here. Create and push another view controller.
    CHHoursViewController *hoursViewController = [[CHHoursViewController alloc] init];
    
    //Grab the worker at this index
    CHWorker *worker = [self.workersArray objectAtIndex:indexPath.row];
    
    //Pass the worker shifts to the next view controller
    hoursViewController.worker = worker;
    
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:hoursViewController animated:YES];
}

@end
