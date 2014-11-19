//
//  NSDate+DateInRange.h
//
//  Created by Michael DeWitt on 10/15/14.
//  Copyright (c) 2014 Startup-Weekend. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+DateComponents.h"

@interface NSDate (DateInRange)

+ (NSDate *)md_dateThatIsNumberOfDaysFromToday:(NSInteger)numberOfDays;

- (BOOL)md_isToday;

/*!	Tests if the receiver is between two dates.
 *	@param[in]	startDate	Start or range
 *	@param[in]	endDate	    End or range
 *	@return		True if date is in range.
 */
- (BOOL)md_isBetweenStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate;

///Tests if the receiver's time is between two dates.
/*! Compares only the time component of each day, neutralizing the date component.
 *	@param[in]	startDate	Start or range
 *	@param[in]	endDate	    End or range
 *	@return		True if date's time is in range.
 */
- (BOOL)md_timeComponentIsBetweenStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate;

@end