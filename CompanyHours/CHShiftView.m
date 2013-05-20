//
//  CHShiftView.m
//  CompanyHours
//
//  Created by Jesus Morales on 5/17/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import "CHShiftView.h"

#define thumbSpaceTop 20
#define thumbSpaceLeft 20

@implementation CHShiftView

@synthesize dateLabel = _dateLabel;
@synthesize hoursLabel = _hoursLabel;
@synthesize notesLabel = _notesLabel;
@synthesize notesTextView = _notesTextView;
@synthesize shift = _shift;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UIFont *systemLabelFont = [UIFont systemFontOfSize:[UIFont labelFontSize]];
        
        NSDate *dateOfShift = self.shift.shiftDate;
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"cccc, MM/dd"];
        NSString *dateLabelText = [formatter stringFromDate:dateOfShift];
        CGSize dateLabelHeight = [dateLabelText sizeWithFont:systemLabelFont];
        CGRect dateLabelFrame = CGRectMake(self.bounds.origin.x + thumbSpaceLeft,
                                           self.bounds.origin.y + thumbSpaceTop,
                                           dateLabelHeight.width,
                                           dateLabelHeight.height);
        self.dateLabel = [[UILabel alloc] initWithFrame:dateLabelFrame];
        [self.dateLabel setText:dateLabelText];
        [self addSubview:self.dateLabel];
        NSLog(@"%@", dateLabelText);
        
        NSString *amountOfHoursString = [NSString stringWithFormat:@"%.02f hours", [self.shift shiftDuration]];
        CGSize hoursLabelSize = [amountOfHoursString sizeWithFont:systemLabelFont];
        CGRect hoursLabelFrame = CGRectMake(self.dateLabel.frame.origin.x,
                                            self.dateLabel.frame.origin.y + self.dateLabel.frame.size.height + thumbSpaceTop,
                                            hoursLabelSize.width,
                                            hoursLabelSize.height);
        self.hoursLabel = [[UILabel alloc] initWithFrame:hoursLabelFrame];
        [self.hoursLabel setText:amountOfHoursString];
        [self addSubview:self.hoursLabel];
        
        NSString *notesLabelString = @"Notes";
        CGSize notesLabelSize = [notesLabelString sizeWithFont:systemLabelFont];
        CGRect notesLabelFrame = CGRectMake(self.hoursLabel.frame.origin.x,
                                            self.hoursLabel.frame.origin.y + self.hoursLabel.frame.size.height + thumbSpaceTop,
                                            notesLabelSize.width,
                                            notesLabelSize.height);
        self.notesLabel = [[UILabel alloc] initWithFrame:notesLabelFrame];
        [self.notesLabel setText:notesLabelString];
        [self addSubview:self.notesLabel];
        
        CGRect notesTextViewFrame = CGRectMake(self.notesLabel.frame.origin.x,
                                               self.notesLabel.frame.origin.y + self.notesLabel.frame.size.height,
                                               self.frame.size.width,
                                               self.frame.size.height - (self.notesLabel.frame.origin.y + self.notesLabel.frame.size.height + 2 * thumbSpaceTop));
        self.notesTextView = [[UITextView alloc] initWithFrame:notesTextViewFrame];
        [self.notesTextView setFont:[UIFont fontWithName:@"Helvetica" size:17.0]];
        [self.notesTextView setText:self.shift.shiftNotes];
        [self.notesTextView setEditable:NO];
        [self addSubview:self.notesTextView];
    }
    return self;
}

-(id)initWithShift:(CHShift *)shift frame:(CGRect)frame
{
    self.shift = shift;
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
