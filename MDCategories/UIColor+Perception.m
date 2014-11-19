//
//  UIColor+isLightColor.m
//
//  Created by Michael DeWitt on 10/14/14.
//
// Original idea found here: http://www.nbdtech.com/Blog/archive/2008/04/27/Calculating-the-Perceived-Brightness-of-a-Color.aspx

#import "UIColor+Perception.h"

#define R_V 0.241
#define G_V 0.691
#define B_V 0.068

@implementation UIColor (Perception)

-(BOOL)md_isPerceivedBright {
    return [self md_isPerceivedBrightWithCutoff:DEFAULT_CUTOFF];
}

- (BOOL)md_isPerceivedBrightWithCutoff:(CGFloat) cutOff {
    
    CGFloat r = 0;
    CGFloat g = 0;
    CGFloat b = 0;
    CGFloat a = 0;
    
    [self getRed:&r green:&g blue:&b alpha:&a];
    
    r *= 255.0;
    g *= 255.0;
    b *= 255.0;
    
    CGFloat brightness = sqrtf(R_V * (r * r) + G_V * (g * g) + B_V * (b * b));
    
    return brightness > cutOff || (brightness > cutOff/2 && a < 0.8);
}

@end
