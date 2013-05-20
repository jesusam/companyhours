//
//  CHAddShiftView.h
//  CompanyHours
//
//  Created by Jesus Morales on 5/17/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHAddShiftView : UIScrollView

@property (strong, nonatomic)IBOutlet UILabel *workerLabel;
@property (strong, nonatomic)IBOutlet UITextField *workerNameField;
@property (strong, nonatomic)IBOutlet UILabel *dateLabel;
@property (strong, nonatomic)IBOutlet UIDatePicker *datePickerView;
@property (strong, nonatomic)IBOutlet UILabel *hoursLabel;
@property (strong, nonatomic)IBOutlet UIPickerView *hoursPickerView;
@property (strong, nonatomic)IBOutlet UILabel *notesLabel;
@property (strong, nonatomic)IBOutlet UITextField *notesTextField;
@property (strong, nonatomic)NSString *workerName;

-(CHAddShiftView *)initWithWorkerName:(NSString *)workername frame:(CGRect)frame;

@end
