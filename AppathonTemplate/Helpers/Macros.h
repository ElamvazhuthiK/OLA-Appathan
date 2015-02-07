//
//  Macros.h
//  testapp
//
//  Created by inxs tech on 24/12/09.
//  Copyright 2009 inxs technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define UIColorFromARGB(argbValue) [UIColor \
colorWithRed:((float)((argbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((argbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(argbValue & 0xFF))/255.0 \
alpha:((float)((argbValue & 0xFF000000) >> 24))/255.0]

#define isViewInScreen(v) CGRectContainsRect([[Screen getCurrentScreenBounds] mainScreen] bounds], v.frame)

#define RGBFromUIColor(color) FloatsToHex(CGColorGetComponents([color CGColor]))

#define InvertColor(color) UIColorFromARGB(FloatsToHex(Invert(CGColorGetComponents([color CGColor]))))

static float* HexToFloats(int c)
{
    static float components[4];
    components[0] = ((c>>24)&0xFF)/255.0;
    components[1] = ((c>>16)&0xFF)/255.0;
    components[2] = ((c>> 8)&0xFF)/255.0;
    components[3] = ((c    )&0xFF)/255.0;
    return components;
}

static int FloatsToHex(const CGFloat *c)
{
    return ((int)(c[3]*0xff)<<24) + ((int)(c[0]*0xff)<<16)+ ((int)(c[1]*0xff)<<8) + ((int)(c[2]*0xff));
}

static float* Invert(const CGFloat *c)
{
    static float components[4];
    components[0] = 1.0-c[0];
    components[1] = 1.0-c[1];
    components[2] = 1.0-c[2];
    components[3] = c[3];
    return components;
}

struct Version {
	int major;
	int minor;
	int release;
};
typedef struct Version Version;
