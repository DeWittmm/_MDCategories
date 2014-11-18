//
//  NSDate+ExOpenHours.h
//  Expresso
//
//  Created by Michael DeWitt on 10/15/14.
//  Copyright (c) 2014 Startup-Weekend. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DateInRange)

+ (BOOL)md_isTimeOfDate:(NSDate *)targetDate betweenStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate;

@end
