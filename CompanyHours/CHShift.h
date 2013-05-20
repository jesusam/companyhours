//
//  CHShift.h
//  CompanyHours
//
//  Created by Jesus Morales on 5/15/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHShift : NSObject

@property (strong, readonly, nonatomic) NSDate *shiftDate;
@property (assign, readonly, nonatomic) double shiftDuration;
@property (copy, readonly, nonatomic) NSString *shiftNotes;

-(id)initWithDate:(NSDate *)shiftDate
         duration:(double)shiftDuration
            notes:(NSString *)shiftNotes;

-(id)initWithDate:(NSDate *)shiftDate
         duration:(double)shiftDuration;

@end
