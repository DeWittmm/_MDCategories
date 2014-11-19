//
//  NSMutableArray+EnumerateForMutation.h
//  Expresso
//
//  Created by Michael DeWitt on 11/1/14.
//  Copyright (c) 2014 Startup-Weekend. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (EnumerateForMutation)
/**
 Enumerates array backwards to allow items to be removed without destrying indexing.
 @param <#parameter#>
 @returns <#retval#>
 */
- (BOOL)rek_enumerateForMutation:(void (^)(id obj, NSUInteger idx, BOOL *stop, BOOL *removed))block;

@end
