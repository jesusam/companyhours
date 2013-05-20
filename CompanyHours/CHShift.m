//
//  CHShift.m
//  CompanyHours
//
//  Created by Jesus Morales on 5/15/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import "CHShift.h"

@implementation CHShift

@synthesize shiftDate = _shiftDate;
@synthesize shiftDuration = _shiftDuration;
@synthesize shiftNotes = _shiftNotes;

-(id)initWithDate:(NSDate *)shiftDate
         duration:(double)shiftDuration
            notes:(NSString *)shiftNotes
{
    self = [super init];
    
    if (self)
    {
        _shiftDate = shiftDate;
        _shiftDuration = shiftDuration;
        _shiftNotes = shiftNotes;
    }
    
    return self;
}

-(id)initWithDate:(NSDate *)shiftDate
         duration:(double)shiftDuration
{
    return [self initWithDate:shiftDate
                     duration:shiftDuration
                        notes:@"none"];
}

@end
