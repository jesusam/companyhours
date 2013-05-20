//
//  CHHoursViewController.h
//  CompanyHours
//
//  Created by Jesus Morales on 5/17/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHWorker.h"
#import "CHAddShiftViewController.h"

@interface CHHoursViewController : UITableViewController <CHAddShiftViewControllerDelegate>

@property (nonatomic, copy) NSMutableArray *shifts;
@property (nonatomic, strong) CHWorker *worker;

-(IBAction)addShift:(id)sender;
-(void)addShiftConfirm:(CHShift *)s;

@end
