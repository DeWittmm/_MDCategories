//
//  NSString+AddOns.m
//  MDCategories
//
//  Created by Michael DeWitt on 11/18/14.
//  Copyright (c) 2014 Michael DeWitt. All rights reserved.
//

#import "NSString+AddOns.h"

@implementation NSString (AddOns)

- (BOOL)md_containsString:(NSString *)string {
    return !NSEqualRanges([self rangeOfString:string], NSMakeRange(NSNotFound, 0));
}

@end
