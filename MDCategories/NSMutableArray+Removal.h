//
//  NSMutableArray+EnumerateForMutation.h
//  Expresso
//
//  Created by Michael DeWitt on 11/1/14.
//  Copyright (c) 2014 Startup-Weekend. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Removal)

- (BOOL)md_removeSingleObject:(id)obj;

/**
 Enumerates array backwards to allow items to be removed without destrying indexing.
 @param block Represents current state of enumeration with the ability to end early, and mark removal.
 @returns removed (Managed by block)
 */
- (BOOL)md_enumerateForMutation:(void (^)(id obj, NSUInteger idx, BOOL *stop, BOOL *removed))block;

@end
