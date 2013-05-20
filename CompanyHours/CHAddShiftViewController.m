//
//  CHAddShiftViewController.m
//  CompanyHours
//
//  Created by Jesus Morales on 5/17/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import "CHAddShiftViewController.h"
#import "CHAddShiftView.h"
#import "CHAddShiftView.h"

@interface CHAddShiftViewController ()

@end

@implementation CHAddShiftViewController

@synthesize shift = _shift;
@synthesize view;
@synthesize pickerView = _pickerView;
@synthesize pickerHours = _pickerHours;
@synthesize pickerMinutes = _pickerMinutes;
@synthesize workerName = _workerName;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        CGRect screenSize = [[UIScreen mainScreen] bounds];
        CGRect statusBarSize = [[UIApplication sharedApplication] statusBarFrame];
        CGRect navigationBarSize = [[[self navigationController] navigationBar] frame];
        
        CGRect rect = CGRectMake(0, 0, screenSize.size.width, screenSize.size.height - statusBarSize.size.height - navigationBarSize.size.height);
        CHAddShiftView *addShiftView = [[CHAddShiftView alloc] initWithWorkerName:self.workerName frame:rect];
        
        [[self navigationItem] setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Confirm" style:UIBarButtonItemStyleBordered target:self action:@selector(addShift:)]];
        [self setView:addShiftView];
        
        [[self navigationItem] setTitle:@"Add Shift"];
        
        self.pickerHours = [NSMutableArray array];
        for (int i = 0; i <= 23; i++)
        {
            [self.pickerHours addObject:[NSString stringWithFormat:@"%d",i]];
        }
        self.pickerMinutes = [NSMutableArray array];
        for (int i = 0; i <= 4; i++)
        {
            [self.pickerMinutes addObject:[NSString stringWithFormat:@"%d",i*15]];
        }
        self.pickerView = self.view.hoursPickerView;
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
        self.pickerView.opaque = NO;
        
        [self.view.notesTextField setReturnKeyType:UIReturnKeyDone];
        [self.view.notesTextField setDelegate:self];
    }
    return self;
}

-(CHAddShiftViewController *)initWithWorkerName:(NSString *)name
{
    self.workerName = name;
    return [self init];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0)
    {
        return 24;
    }
    else
    {
        return 4;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0)
    {
        return [self.pickerHours objectAtIndex:row];
    }
    else
    {
        return [self.pickerMinutes objectAtIndex:row];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    CGRect statusBarSize = [[UIApplication sharedApplication] statusBarFrame];
    CGRect navigationBarSize = [[[self navigationController] navigationBar] frame];
    
    self.view.contentSize = CGSizeMake(self.view.contentSize.width, self.view.contentSize.height + 216);
    [self.view scrollRectToVisible:CGRectMake(0, self.view.contentSize.height - (screenSize.size.height - statusBarSize.size.height - navigationBarSize.size.height), self.view.contentSize.width, screenSize.size.height - statusBarSize.size.height - navigationBarSize.size.height) animated:YES];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    CGRect statusBarSize = [[UIApplication sharedApplication] statusBarFrame];
    CGRect navigationBarSize = [[[self navigationController] navigationBar] frame];
    
    self.view.contentSize = CGSizeMake(self.view.contentSize.width, self.view.contentSize.height - 216);
    [self.view scrollRectToVisible:CGRectMake(0, self.view.contentSize.height - (screenSize.size.height - statusBarSize.size.height - navigationBarSize.size.height), self.view.contentSize.width, screenSize.size.height - statusBarSize.size.height - navigationBarSize.size.height) animated:YES];
}

-(IBAction)addShift:(id)sender
{
    if ([self.view.hoursPickerView selectedRowInComponent:0] == 0 && [self.view.hoursPickerView selectedRowInComponent:1] == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Please pick a duration under Hours" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else if (self.view.notesTextField.text == nil)
    {
        double duration = [[self.pickerHours objectAtIndex:[self.view.hoursPickerView selectedRowInComponent:0]] doubleValue] + [[self.pickerMinutes objectAtIndex:[self.view.hoursPickerView selectedRowInComponent:1]] doubleValue] / 60.0;
        CHShift *shift = [[CHShift alloc] initWithDate:self.view.datePickerView.date duration:duration];
        [self.delegate addShiftConfirm:shift];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        double duration = [[self.pickerHours objectAtIndex:[self.view.hoursPickerView selectedRowInComponent:0]] doubleValue] + [[self.pickerMinutes objectAtIndex:[self.view.hoursPickerView selectedRowInComponent:1]] doubleValue] / 60.0;
        NSString *notes = [self.view.notesTextField text];
        CHShift *shift = [[CHShift alloc] initWithDate:self.view.datePickerView.date duration:duration notes:notes];
        [self.delegate addShiftConfirm:shift];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
