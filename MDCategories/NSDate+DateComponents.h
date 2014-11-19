//
//  NSDate+DateComponents.h
//
//  Created by Michael DeWitt on 10/31/14.
//  Copyright (c) 2014 Startup-Weekend. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DateComponents)

- (NSDateComponents *)md_dateComponents;

///Not very international but returns a nice mm/dd/yyyy
- (NSString *)md_dateDayMonthYearComponents;

/// hh:mm
- (NSString *)md_timeComponents;

+ (NSString *)md_timeComponentsSecondsFromNow:(NSInteger)seconds;

@end
