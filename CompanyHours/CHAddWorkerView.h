//
//  CHAddWorkerView.h
//  CompanyHours
//
//  Created by Jesus Morales on 5/16/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface CHAddWorkerView : UIView

@property (strong, nonatomic)IBOutlet UILabel *nameLabel;
@property (strong, nonatomic)IBOutlet UITextField *nameTextField;
@property (strong, nonatomic)IBOutlet UILabel *gradYearLabel;
@property (strong, nonatomic)IBOutlet UIPickerView *gradYearPickerView;

@end
