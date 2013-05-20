//
//  CHAddWorkerViewController.h
//  CompanyHours
//
//  Created by Jesus Morales on 5/16/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHWorker.h"
@class CHAddWorkerView;

@protocol CHAddWorkerViewControllerDelegate <NSObject>

-(void)addWorkerConfirm:(CHWorker *)w;

@end

@interface CHAddWorkerViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>

@property (nonatomic, strong) CHWorker *worker;
@property (nonatomic, strong) CHAddWorkerView *view;
@property (nonatomic, weak) UIPickerView *pickerView;
@property (nonatomic, strong) NSMutableArray *pickerData;
@property (nonatomic, weak) id <CHAddWorkerViewControllerDelegate> delegate;

-(IBAction)addEmployee:(id)sender;

@end
