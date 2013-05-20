//
//  CHAddWorkerViewController.m
//  CompanyHours
//
//  Created by Jesus Morales on 5/16/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import "CHAddWorkerViewController.h"
#import "CHAddWorkerView.h"
#import "CHWorker.h"

@interface CHAddWorkerViewController ()

@end

@implementation CHAddWorkerViewController

@synthesize worker = _worker;
@synthesize view;
@synthesize pickerView = _pickerView;
@synthesize pickerData = _pickerData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        CGRect screenSize = [[UIScreen mainScreen] bounds];
        CGRect statusBarSize = [[UIApplication sharedApplication] statusBarFrame];
        CGRect navigationBarSize = [[[self navigationController] navigationBar] frame];
        
        CGRect rect = CGRectMake(0, 0, screenSize.size.width, screenSize.size.height - statusBarSize.size.height - navigationBarSize.size.height);
        CHAddWorkerView *addWorkerView = [[CHAddWorkerView alloc] initWithFrame:rect];

        [[self navigationItem] setRightBarButtonItem: [[UIBarButtonItem alloc] initWithTitle:@"Confirm" style:UIBarButtonItemStyleBordered target:self action:@selector(addEmployee:)]];
        [self setTitle:@"Add Worker"];
        [self setView:addWorkerView];

        
        self.pickerData = [NSMutableArray array];
        for (int i = 2000; i <= 2040; i++)
        {
            [self.pickerData addObject:[NSString stringWithFormat:@"%d",i]];
        }
        self.pickerView = self.view.gradYearPickerView;
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
        self.pickerView.opaque = NO;
        
        [self.view.nameTextField setReturnKeyType:UIReturnKeyDone];
        [self.view.nameTextField setDelegate:self];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
//    CGRect screenSize = [[UIScreen mainScreen] bounds];
//    CGRect statusBarSize = [[UIApplication sharedApplication] statusBarFrame];
//    CGRect navigationBarSize = [[[self navigationController] navigationBar] frame];
//    
//    CGRect rect = CGRectMake(0, 0, screenSize.size.width, screenSize.size.height - statusBarSize.size.height - navigationBarSize.size.height);
//    CHAddWorkerView *addWorkerView = [[CHAddWorkerView alloc] initWithFrame:rect];
//    [[self navigationItem] setRightBarButtonItem: [[UIBarButtonItem alloc] initWithTitle:@"Confirm" style:UIBarButtonItemStyleBordered target:self action:@selector(addEmployee:)]];
//    [self setTitle:@"Add Worker"];
//    [self setView:addWorkerView];
//    
//    self.pickerData = [NSMutableArray array];
//    for (int i = 2000; i <= 2040; i++)
//    {
//        [self.pickerData addObject:[NSString stringWithFormat:@"%d",i]];
//    }
//    self.pickerView.dataSource = self;
//    self.pickerView.delegate = self;
//    self.pickerView.opaque = NO;
//    
//    [self.view.nameTextField setReturnKeyType:UIReturnKeyDone];
//    [self.view.nameTextField setDelegate:self];
}

-(void)viewDidUnload
{
    self.pickerView = nil;
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)addEmployee:(id)sender
{
    if (self.view.nameTextField.text == nil)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Please complete name field" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [alert show];
    }
    else
    {
        NSString *workerName = self.view.nameTextField.text;
        NSString *workerGradYearString = [self.pickerData objectAtIndex:[self.view.gradYearPickerView selectedRowInComponent:0]];
        int workerGradYear = [workerGradYearString intValue];
        CHWorker *worker = [[CHWorker alloc] initWithName:workerName graduationYear:workerGradYear];
        [self.delegate addWorkerConfirm:worker];
        [[self navigationController] popViewControllerAnimated:YES];
    }
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.pickerData count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.pickerData objectAtIndex:row];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return NO;
}

@end
