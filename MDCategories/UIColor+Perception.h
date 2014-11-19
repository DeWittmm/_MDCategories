//
//  UIColor+isLightColor.h
//
//  Created by Michael DeWitt on 10/14/14.
//

#import <UIKit/UIKit.h>

@interface UIColor (Perception)

#define DEFAULT_CUTOFF 130
#define ALPHA_CUTOFF 0.8

///Default cutoff of 130
- (BOOL)md_isPerceivedBright;

/*!	Cutoff range should typically be between 128-145
 *	@param 	cutoff	The value to compare the overall brightness to.
 *	@return	True if the color is perceived to be bright.
 */
- (BOOL)md_isPerceivedBrightWithCutoff:(CGFloat) cutOff;

@end
