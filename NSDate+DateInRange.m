//
//  NSDate+ExOpenHours.m
//  Expresso
//
//  Created by Michael DeWitt on 10/15/14.
//  Copyright (c) 2014 Startup-Weekend. All rights reserved.
//

#import "NSDate+DateInRange.h"

@implementation NSDate (DateInRange)

//http://stackoverflow.com/questions/13102082/how-to-check-if-the-current-time-is-within-a-specified-range-in-ios

+ (BOOL)md_isTimeOfDate:(NSDate *)targetDate betweenStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate {
    
    NSParameterAssert(targetDate && startDate && endDate);
    
    // Make sure all the dates have the same date component.
    NSDate *newStartDate = [NSDate dateByNeutralizingDateComponentsOfDate:startDate];
    NSDate *newEndDate = [NSDate dateByNeutralizingDateComponentsOfDate:endDate];
    NSDate *newTargetDate = [NSDate dateByNeutralizingDateComponentsOfDate:targetDate];
    
    // Compare the target with the start and end dates
    NSComparisonResult compareTargetToStart = [newTargetDate compare:newStartDate];
    NSComparisonResult compareTargetToEnd = [newTargetDate compare:newEndDate];
    
    return (compareTargetToStart == NSOrderedDescending && compareTargetToEnd == NSOrderedAscending);
}

+ (NSDate *)dateByNeutralizingDateComponentsOfDate:(NSDate *)originalDate {
    static NSCalendar *gregorian;
    
    if (!gregorian) {
        gregorian = [[NSCalendar alloc]
                     initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    }
    
    // Get the components for this date
    NSDateComponents *components = [gregorian components:  (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate: originalDate];
    
    // Set the year, month and day to some values (the values are arbitrary)
    [components setYear:2000];
    [components setMonth:1];
    [components setDay:1];
    
    return [gregorian dateFromComponents:components];
}

@end
