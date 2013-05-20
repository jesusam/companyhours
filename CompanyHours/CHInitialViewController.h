//
//  CHInitialViewController.h
//  CompanyHours
//
//  Created by Jesus Morales on 5/16/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHWorker.h"
#import "CHAddWorkerViewController.h"

@interface CHInitialViewController : UITableViewController <CHAddWorkerViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *workersArray;

-(IBAction)addWorker:(id)sender;
-(void)addWorkerConfirm:(CHWorker *)w;

@end
