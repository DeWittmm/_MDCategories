//
//  NSIndexPath+PrintableIndexPath.h
//
//  Created by Michael DeWitt on 10/31/14.
//  Copyright (c) 2014 Startup-Weekend. All rights reserved.
//

/*   Abstract:
 
Originally inspired by: http://nshipster.com/method-swizzling/
 
 */

#import <Foundation/Foundation.h>

/// Swizzels description to produce printable path: "Row: %zd, Section: %zd".
/**
	
*/
@interface NSIndexPath (PrintableIndexPath)

@end
