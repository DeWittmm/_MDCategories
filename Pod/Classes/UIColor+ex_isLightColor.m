//
//  UIColor+ex_isLightColor.m
//  Expresso
//
//  Created by Michael DeWitt on 10/14/14.
//  Copyright (c) 2014 Startup-Weekend. All rights reserved.
//

#import "UIColor+ex_isLightColor.h"

@implementation UIColor (ex_isLightColor)

-(BOOL)rek_isLightColor {
    const CGFloat *componentColors = CGColorGetComponents(self.CGColor);
    
    CGFloat colorBrightness = ((componentColors[0] * 299) + (componentColors[1] * 587) + (componentColors[2] * 114)) / 1000;
    
    return colorBrightness > 0.5;
}

@end
