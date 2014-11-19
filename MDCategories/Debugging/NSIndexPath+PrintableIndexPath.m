//
//  NSIndexPath+PrintableIndexPath.m
//  Expresso
//
//  Created by Michael DeWitt on 10/31/14.
//  Copyright (c) 2014 Startup-Weekend. All rights reserved.
//

#import "NSIndexPath+PrintableIndexPath.h"
#import <objc/runtime.h>
#import <UIKit/UIKit.h>

@implementation NSIndexPath (PrintableIndexPath)

+ (void)load {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        
        SEL originalSelector = @selector(description);
        SEL swizzledSelector = @selector(printableDescription);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (NSString *)printableDescription {
    //Formattor for NSInteger: %zd
    return [NSString stringWithFormat:@"Row: %zd, Section: %zd", [self row], self.section];
}

@end
