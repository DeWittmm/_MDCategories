//
//  NSArray+RemoveSingle.m
//  ExpressoBarista
//
//  Created by Michael DeWitt on 10/31/14.
//  Copyright (c) 2014 DeWitt. All rights reserved.
//

#import "NSMutableArray+RemoveSingle.h"

@implementation NSMutableArray (RemoveSingle)

- (BOOL)rek_removeSingleObject:(id)obj {
    NSInteger index = [self indexOfObject:obj];
    
    if (index != NSNotFound) {
        [self removeObjectAtIndex:index];
    }
    
    return index != NSNotFound;
}

@end
