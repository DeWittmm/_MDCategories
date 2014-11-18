//
//  NSDate+ComponentsDateFormattor.m
//  Expresso
//
//  Created by Michael DeWitt on 10/31/14.
//  Copyright (c) 2014 Startup-Weekend. All rights reserved.
//

#import "NSDate+ComponentsDateFormattor.h"

@implementation NSDate (ComponentsDateFormattor)

- (NSString *)rek_dateDayMonthYearComponents {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:self];
    return [NSString stringWithFormat:@"%ld/%ld/%ld", (long)[components month], (long)[components day], (long)[components year]];
}

@end
