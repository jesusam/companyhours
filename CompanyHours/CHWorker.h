//
//  CHWorker.h
//  CompanyHours
//
//  Created by Jesus Morales on 5/15/13.
//  Copyright (c) 2013 Jesus Morales. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHWorker : NSObject

@property (copy, nonatomic) NSMutableArray *workerShifts;
@property (copy, nonatomic) NSString *workerName;
@property (assign, nonatomic) int workerGraduationYear;

-(id)initWithName:(NSString *)workerName graduationYear:(int)workerGraduationYear;
-(double)getTotalHours;

@end
