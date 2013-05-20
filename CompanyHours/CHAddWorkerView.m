//
//  CHAddWorkerView.m
//  CompanyHours
//
//  Created by Jesus Morales on 5/16/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import "CHAddWorkerView.h"

#define thumbDistanceTop 20
#define thumbDistanceLeft 20

@implementation CHAddWorkerView

@synthesize nameLabel = _nameLabel;
@synthesize nameTextField = _nameTextField;
@synthesize gradYearLabel = _gradYearLabel;
@synthesize gradYearPickerView = _gradYearPickerView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UIFont *systemLabelFont = [UIFont systemFontOfSize:[UIFont labelFontSize]];
        
        NSString *name = @"Name";
        CGSize nameLabelSize = [name sizeWithFont:systemLabelFont];
        CGRect nameLabelFrame = CGRectMake(self.bounds.origin.x + thumbDistanceLeft,
                                           self.bounds.origin.y + thumbDistanceTop,
                                           nameLabelSize.width,
                                           nameLabelSize.height);
        self.nameLabel = [[UILabel alloc] initWithFrame:nameLabelFrame];
        [self.nameLabel setText:name];
        [self addSubview:self.nameLabel];
        
        CGRect nameTextFieldFrame = CGRectMake(self.nameLabel.frame.origin.x,
                                               self.nameLabel.frame.origin.x + self.nameLabel.frame.size.height + thumbDistanceTop,
                                               self.frame.size.width - 2 * thumbDistanceLeft,
                                               30);
        self.nameTextField = [[UITextField alloc] initWithFrame:nameTextFieldFrame];
        [self.nameTextField setBorderStyle:UITextBorderStyleLine];
        [self addSubview:self.nameTextField];
        
        NSString *gradYear = @"Grad Year";
        CGSize gradYearLabelSize = [gradYear sizeWithFont:systemLabelFont];
        CGRect gradYearLabelFrame = CGRectMake(self.nameTextField.frame.origin.x,
                                               self.nameTextField.frame.origin.y + self.nameTextField.frame.size.height + thumbDistanceTop,
                                               gradYearLabelSize.width,
                                               gradYearLabelSize.height);
        self.gradYearLabel = [[UILabel alloc] initWithFrame:gradYearLabelFrame];
        [self.gradYearLabel setText:gradYear];
        [self addSubview:self.gradYearLabel];
        
        CGRect gradYearPickerFrame = CGRectMake(self.gradYearLabel.frame.origin.x,
                                                self.gradYearLabel.frame.origin.y + self.gradYearLabel.frame.size.height + thumbDistanceTop,
                                                self.frame.size.width - 2 * thumbDistanceLeft,
                                                216);
        self.gradYearPickerView = [[UIPickerView alloc] initWithFrame:gradYearPickerFrame];
        [self addSubview:self.gradYearPickerView];
    }
    return self;
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
