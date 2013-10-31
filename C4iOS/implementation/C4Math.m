//
//  C4Math.m
//  C4iOS
//
//  Copyright © 2010-2013 Travis Kirton
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software
//  and associated documentation files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
//  BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
//  DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "C4Math.h"

static C4Math *sharedC4Math = nil;

@implementation C4Math
#pragma mark Singleton

+(C4Math *)sharedManager {
    if (sharedC4Math == nil) {
        static dispatch_once_t once;
        dispatch_once(&once, ^ {
            sharedC4Math = [[super allocWithZone:NULL] init];
        });
    }
    return sharedC4Math;
}

+(id)allocWithZone:(NSZone *)zone {
    zone = zone;
    return [self sharedManager];
}

-(id)copyWithZone:(NSZone *)zone {
    zone = zone;
    return self;
}

#pragma mark Initialization

+(void)load {
	if(VERBOSELOAD) printf("C4Math\n");
}

#pragma mark Calculation
+(NSInteger)abs:(NSInteger)value {
	return abs((int)value);
}

+(CGFloat)absf:(CGFloat)value {
	return fabsf(value);
}

+(NSInteger)ceil:(CGFloat)value {
	return (NSInteger)ceilf(value);
}

+(NSInteger)constrain:(NSInteger)value min:(NSInteger)min max:(NSInteger)max {
	return (NSInteger)[self constrainf:value min:min max:max];
}

+(CGFloat)constrainf:(CGFloat)value min:(CGFloat)min max:(CGFloat)max {
	if (min < value && value < max) return value;
	else if (value <= min) return min;
	else return max;
}

+(CGFloat)exp:(CGFloat)value {
	return expf(value);
}

+(NSInteger)floor:(CGFloat)value {
	return (NSInteger)floor((double)value);
}

+(CGFloat)lerpBetweenA:(CGFloat)a B:(CGFloat)b byAmount:(CGFloat)amount {
    CGFloat range = b-a;
	return a+range*amount;
}

+(CGFloat)log:(CGFloat)value {
	return logf(value);
}

+(CGFloat)map:(CGFloat)value
       fromMin:(CGFloat)min1
           max:(CGFloat)max1
         toMin:(CGFloat)min2
           max:(CGFloat)max2 {
	CGFloat rangeLength1 = max1-min1;
	CGFloat rangeLength2 = max2-min2;
	CGFloat multiplier   = (value-min1)/rangeLength1;
	return multiplier*rangeLength2+min2;
}

+(CGFloat)maxOfA:(CGFloat)a B:(CGFloat)b {
	CGFloat max = a > b ? a : b;
	return max;
}

+(CGFloat)maxOfA:(CGFloat)a B:(CGFloat)b C:(CGFloat)c {
	return [self maxOfA:[self maxOfA:a B:b] B:c];
}


+(CGFloat)minOfA:(CGFloat)a B:(CGFloat)b {
	CGFloat min = a < b ? a : b;
	return min;
}

+(CGFloat)minOfA:(CGFloat)a B:(CGFloat)b C:(CGFloat)c {
	return [self minOfA:[self minOfA:a B:b] B:c];
}

+(CGFloat)norm:(CGFloat)value fromMin:(CGFloat)min toMax:(CGFloat)max {
    value = value;
    min = min;
    max = max;
	return 0;
}

+(CGFloat)pow:(CGFloat)value raisedTo:(CGFloat)degree {
	return powf(value,degree);
}

+(CGFloat)round:(CGFloat)value {
	return roundf(value);
}

+(CGFloat)square:(CGFloat)value {
	return powf(value, 2);
}

+(CGFloat)sqrt:(CGFloat)value {
	return sqrtf(value);
}

#pragma mark Trigonometry
+(CGFloat)acos:(CGFloat)value {
	return acosf(value);
}

+(CGFloat)asin:(CGFloat)value {
	return asinf(value);
}

+(CGFloat)atan:(CGFloat)value {
	return atanf(value);
}

+(CGFloat)atan2Y:(CGFloat)y X:(CGFloat)x {
	return atan2f(y,x);
}

+(CGFloat)cos:(CGFloat)value {
	return cosf(value);
}
+(CGFloat)sin:(CGFloat)value {
	return sinf(value);
}

+(CGFloat)tan:(CGFloat)value {
	return tanf(value);
}
#pragma mark Random
+(NSInteger)randomInt:(NSInteger)value {
	srandomdev();
	return ((NSInteger)random())%value;
}

+(NSInteger)randomIntBetweenA:(NSInteger)a andB:(NSInteger)b{
    NSInteger returnVal = 0;
	if (a == b) {
        returnVal = a;
    } else {
        NSInteger max = a > b ? a : b;
        NSInteger min = a < b ? a : b;
        C4Assert(max-min > 0, @"max-min <= 0 ?!... max = %ld, min = %ld", (long)max, (long)min);
        srandomdev();
        returnVal = (((NSInteger)random())%(max-min) + min);
    }
    return returnVal;
}

#pragma mark Math Conversion Functions
NSInteger RadiansToDegrees(CGFloat radianValue) {
    NSInteger degreeValue = (NSInteger)((radianValue) * 180.0f / PI);
    return degreeValue;
}

CGFloat DegreesToRadians(NSInteger degreeValue) {
    CGFloat radianValue = degreeValue * PI / 180.0f;
    return radianValue;
}

NSInteger FloatToRGB(CGFloat floatValue) {
    NSInteger rgbValue = (NSInteger)(floatValue > 1.0f ? 255 : floatValue * 255.0f);
    return rgbValue;
}

CGFloat RGBToFloat(NSInteger rgbValue) {
    if(rgbValue < 0) rgbValue = 0;
    CGFloat floatValue = ((CGFloat)rgbValue) / 255.0f;
    return floatValue;
}

@end