//
//  CHAddShiftViewController.h
//  CompanyHours
//
//  Created by Jesus Morales on 5/17/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHShift.h"
@class CHAddShiftView;

@protocol CHAddShiftViewControllerDelegate <NSObject>

-(void)addShiftConfirm:(CHShift *)s;

@end

@interface CHAddShiftViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>

@property (nonatomic, strong) CHShift *shift;
@property (nonatomic, strong) CHAddShiftView *view;
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) NSMutableArray *pickerHours;
@property (nonatomic, strong) NSMutableArray *pickerMinutes;
@property (nonatomic, strong) NSString *workerName;
@property (nonatomic, weak) id <CHAddShiftViewControllerDelegate> delegate;

-(IBAction)addShift:(id)sender;
-(CHAddShiftViewController *)initWithWorkerName:(NSString *)name;

@end
