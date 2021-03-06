//
//  NSDate+DateInRange.m
//
//  Created by Michael DeWitt on 10/15/14.
//  Copyright (c) 2014 Startup-Weekend. All rights reserved.
//

#import "NSDate+DateInRange.h"

@implementation NSDate (DateInRange)

+ (NSDate *)md_dateThatIsNumberOfDaysFromToday:(NSInteger)numberOfDays {
    NSDateComponents *components = [[NSDate date] md_dateComponents];
    components.day = components.day + numberOfDays;
    
    return [[NSCalendar autoupdatingCurrentCalendar] dateFromComponents:components];
}

- (BOOL)md_isToday {
    NSDate *yesterday = [NSDate md_dateThatIsNumberOfDaysFromToday:-1];
    NSDate *tomorrow = [NSDate md_dateThatIsNumberOfDaysFromToday:1];
    
    return [self md_isBetweenStartDate:yesterday andEndDate:tomorrow];
}

- (BOOL)md_isBetweenStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate {
    
    NSParameterAssert(startDate && endDate);
    
    // Compare the target with the start and end dates
    NSComparisonResult compareTargetToStart = [self compare:startDate];
    NSComparisonResult compareTargetToEnd = [self compare:endDate];
    
    return (compareTargetToStart == NSOrderedDescending && compareTargetToEnd == NSOrderedAscending);
}

//http://stackoverflow.com/questions/13102082/how-to-check-if-the-current-time-is-within-a-specified-range-in-ios
- (BOOL)md_timeComponentIsBetweenStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate {
    NSParameterAssert(startDate && endDate);

    // Make sure all the dates have the same date component.
    NSDate *newStartDate = [NSDate dateByNeutralizingDateComponentsOfDate:startDate];
    NSDate *newEndDate = [NSDate dateByNeutralizingDateComponentsOfDate:endDate];
    NSDate *newTargetDate = [NSDate dateByNeutralizingDateComponentsOfDate:self];
    
    return [newTargetDate md_isBetweenStartDate:newStartDate andEndDate:newEndDate];
}

#pragma mark - Private Functions

+ (NSDate *)dateByNeutralizingDateComponentsOfDate:(NSDate *)originalDate {
    static NSCalendar *gregorian;
    
    if (!gregorian) {
        gregorian = [[NSCalendar alloc]
                     initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    }
    
    // Get the components for this date
    NSDateComponents *components = [originalDate md_dateComponents];
    
    // Set the year, month and day to some values (the values are arbitrary)
    [components setYear:2000];
    [components setMonth:1];
    [components setDay:1];
    
    return [gregorian dateFromComponents:components];
}

@end
