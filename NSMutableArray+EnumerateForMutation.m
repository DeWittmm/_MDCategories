//
//  NSMutableArray+EnumerateForMutation.m
//  Expresso
//
//  Created by Michael DeWitt on 11/1/14.
//  Copyright (c) 2014 Startup-Weekend. All rights reserved.
//

#import "NSMutableArray+EnumerateForMutation.h"

@implementation NSMutableArray (EnumerateForMutation)

- (BOOL)rek_enumerateForMutation:(void (^)(id obj, NSUInteger idx, BOOL *stop, BOOL *removed))block {
    
    BOOL didRemove = NO;
    BOOL shouldStop = NO;
    
    for (NSInteger i = [self count] - 1; i >= 0; i--) {
        id obj = [self objectAtIndex: i];
        block(obj, i, &shouldStop, &didRemove);
    }
    
    return didRemove;
}

@end
