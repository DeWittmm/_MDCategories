//
//  NSDate+DateComponents.m
//
//  Created by Michael DeWitt on 10/31/14.
//  Copyright (c) 2014 Startup-Weekend. All rights reserved.
//

#import "NSDate+DateComponents.h"

@implementation NSDate (DateComponents)

- (NSDateComponents *)md_dateComponents {
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSUInteger componentUnitFlags = (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond);
    NSDateComponents *dateComponents = [calendar components:componentUnitFlags fromDate:self];
    
    return dateComponents;
}

- (NSString *)md_dateDayMonthYearComponents {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:self];
    return [NSString stringWithFormat:@"%ld/%ld/%ld", (long)[components month], (long)[components day], (long)[components year]];
}

- (NSString *)md_timeComponents {
    return [[self timeFormatter] stringFromDate:self];
}

+ (NSString *)md_timeComponentsSecondsFromNow:(NSInteger)seconds {
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:seconds];
    return [date md_timeComponents];
}

#pragma mark - Private Helper

- (NSDateFormatter *)timeFormatter {
    static NSDateFormatter *timeFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        timeFormatter = [[NSDateFormatter alloc] init];
        timeFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        [timeFormatter setDateFormat:@"h:mm a"];
        [timeFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    });
    
    return timeFormatter;
}

@end
