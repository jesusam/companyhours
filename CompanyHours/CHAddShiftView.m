//
//  CHAddShiftView.m
//  CompanyHours
//
//  Created by Jesus Morales on 5/17/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import "CHAddShiftView.h"

#define thumbDistanceLeft 20
#define thumbDistanceTop 20

@implementation CHAddShiftView

@synthesize workerLabel = _workerLabel;
@synthesize workerNameField = _workerNameField;
@synthesize dateLabel = _dateLabel;
@synthesize datePickerView = _datePickerView;
@synthesize hoursLabel = _hoursLabel;
@synthesize hoursPickerView = _hoursPickerView;
@synthesize notesLabel = _notesLabel;
@synthesize notesTextField = _notesTextField;
@synthesize workerName = _workerName;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UIFont *systemLabelFont = [UIFont systemFontOfSize:[UIFont labelFontSize]];
        
        NSString *worker = @"Worker";
        CGSize workerLabelSize = [worker sizeWithFont:systemLabelFont];
        CGRect workerLabelFrame = CGRectMake(self.bounds.origin.x + thumbDistanceLeft,
                                             self.bounds.origin.y + thumbDistanceTop,
                                             workerLabelSize.width,
                                             workerLabelSize.height);
        self.workerLabel = [[UILabel alloc] initWithFrame:workerLabelFrame];
        [self.workerLabel setText:worker];
        [self addSubview:self.workerLabel];

//        CGSize workerNameSize = [self.workerName sizeWithFont:systemLabelFont];
//        CGRect workerNameFrame = CGRectMake(workerLabelFrame.origin.x,
//                                            workerLabelFrame.origin.y, <#CGFloat width#>, <#CGFloat height#>)
        CGSize workerNameFieldSize = [self.workerName sizeWithFont:[UIFont fontWithName:@"Helvetica" size:17.0]];
        CGRect workerNameFieldFrame = CGRectMake(workerLabelFrame.origin.x,
                                                 workerLabelFrame.origin.y + workerLabelFrame.size.height + thumbDistanceTop,
                                                 workerNameFieldSize.width + 5,
                                                 25);
        self.workerNameField = [[UITextField alloc] initWithFrame:workerNameFieldFrame];
        [self.workerNameField setText:self.workerName];
        [self.workerNameField setBorderStyle:UITextBorderStyleLine];
        [self.workerNameField setUserInteractionEnabled:NO];
        [self addSubview:self.workerNameField];
        
        NSString *date = @"Date";
        CGSize dateLabelSize = [date sizeWithFont:systemLabelFont];
        CGRect dateLabelFrame = CGRectMake(workerNameFieldFrame.origin.x,
                                           workerNameFieldFrame.origin.y + workerNameFieldFrame.size.height + thumbDistanceTop,
                                           dateLabelSize.width,
                                           dateLabelSize.height);
        self.dateLabel = [[UILabel alloc] initWithFrame:dateLabelFrame];
        [self.dateLabel setText:date];
        [self addSubview:self.dateLabel];
        
        CGRect datePickerViewFrame = CGRectMake(frame.size.width - 320,
                                                dateLabelFrame.origin.y + dateLabelFrame.size.height + thumbDistanceTop,
                                                frame.size.width - 40,
                                                216);
        self.datePickerView = [[UIDatePicker alloc] initWithFrame:datePickerViewFrame];
        [self.datePickerView setDatePickerMode:UIDatePickerModeDate];
        [self addSubview:self.datePickerView];
        
        NSString *hours = @"Hours";
        CGSize hoursLabelSize = [hours sizeWithFont:systemLabelFont];
        CGRect hoursLabelFrame = CGRectMake(datePickerViewFrame.origin.x + 20,
                                            datePickerViewFrame.origin.y + datePickerViewFrame.size.height + thumbDistanceTop,
                                            hoursLabelSize.width,
                                            hoursLabelSize.height);
        self.hoursLabel = [[UILabel alloc] initWithFrame:hoursLabelFrame];
        [self.hoursLabel setText:hours];
        [self addSubview:self.hoursLabel];
        
        CGRect hoursPickerFrame = CGRectMake(hoursLabelFrame.origin.x,
                                                hoursLabelFrame.origin.y + hoursLabelFrame.size.height + thumbDistanceTop,
                                                self.frame.size.width - 2 * thumbDistanceLeft,
                                                216);
        self.hoursPickerView = [[UIPickerView alloc] initWithFrame:hoursPickerFrame];
        [self addSubview:self.hoursPickerView];
        
        NSString *notes = @"Notes";
        CGSize notesLabelSize = [notes sizeWithFont:systemLabelFont];
        CGRect notesLabelFrame = CGRectMake(hoursPickerFrame.origin.x,
                                            hoursPickerFrame.origin.y + hoursPickerFrame.size.height + thumbDistanceTop,
                                            notesLabelSize.width,
                                            notesLabelSize.height);
        self.notesLabel = [[UILabel alloc] initWithFrame:notesLabelFrame];
        [self.notesLabel setText:notes];
        [self addSubview:self.notesLabel];
        
        CGRect notesTextFrame = CGRectMake(notesLabelFrame.origin.x,
                                           notesLabelFrame.origin.y + notesLabelFrame.size.height + thumbDistanceTop,
                                           frame.size.width - 2 * thumbDistanceLeft,
                                           25);
        self.notesTextField = [[UITextField alloc] initWithFrame:notesTextFrame];
        [self.notesTextField setBorderStyle:UITextBorderStyleLine];
        [self addSubview:self.notesTextField];
        
        [self setContentSize:CGSizeMake(frame.size.width, notesTextFrame.origin.y + notesTextFrame.size.height + thumbDistanceTop)];
    }
    return self;
}

-(CHAddShiftView *)initWithWorkerName:(NSString *)workername frame:(CGRect)frame;
{
    self.workerName = workername;
    return [self initWithFrame:frame];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
