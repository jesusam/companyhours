//
//  CHShiftViewController.h
//  CompanyHours
//
//  Created by Jesus Morales on 5/17/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHShiftView.h"

@interface CHShiftViewController : UIViewController

@property (nonatomic, strong)CHShift *shift;
@property (nonatomic, strong)CHShiftView *view;

-(id)initWithShift:(CHShift *)s;

@end
