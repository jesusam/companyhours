//
//  CHShiftView.h
//  CompanyHours
//
//  Created by Jesus Morales on 5/17/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHShift.h"

@interface CHShiftView : UIView

@property (nonatomic, strong)IBOutlet UILabel *dateLabel;
@property (nonatomic, strong)IBOutlet UILabel *hoursLabel;
@property (nonatomic, strong)IBOutlet UILabel *notesLabel;
@property (nonatomic, strong)IBOutlet UITextView *notesTextView;
@property (nonatomic, strong)CHShift *shift;

-(id)initWithShift:(CHShift *)shift frame:(CGRect)frame;

@end
