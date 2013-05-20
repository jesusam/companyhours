//
//  CHShiftViewController.m
//  CompanyHours
//
//  Created by Jesus Morales on 5/17/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import "CHShiftViewController.h"

@interface CHShiftViewController ()

@end

@implementation CHShiftViewController

@synthesize shift = _shift;
@synthesize view;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        CGRect screenSize = [[UIScreen mainScreen] bounds];
        CGRect statusBarSize = [[UIApplication sharedApplication] statusBarFrame];
        CGRect navigationBarSize = [[[self navigationController] navigationBar] frame];
        
        CGRect rect = CGRectMake(0, 0, screenSize.size.width, screenSize.size.height - statusBarSize.size.height - navigationBarSize.size.height);
        CHShiftView *shiftView = [[CHShiftView alloc] initWithShift:self.shift frame:rect];
        
        [self setView:shiftView];
        
        [[self navigationItem] setTitle:@"Shift"];
    }
    return self;
}

-(id)initWithShift:(CHShift *)s
{
    self.shift = s;
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

@end
