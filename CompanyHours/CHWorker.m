//
//  CHWorker.m
//  CompanyHours
//
//  Created by Jesus Morales on 5/15/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import "CHWorker.h"
#import "CHShift.h"

@implementation CHWorker

@synthesize workerShifts = _workerShifts;
@synthesize workerName = _workerName;
@synthesize workerGraduationYear = _workerGraduationYear;

-(id)initWithName:(NSString *)workerName graduationYear:(int)workerGraduationYear
{
    self = [super init];
    
    if (self)
    {
        _workerShifts = [NSMutableArray array];
        _workerName = workerName;
        _workerGraduationYear = workerGraduationYear;
    }
    
    return self;
}

-(double)getTotalHours
{
    double totalHours = 0;
    
    for (CHShift *shift in _workerShifts)
    {
        totalHours += [shift shiftDuration];
    }
    
    return totalHours;
}

@end
