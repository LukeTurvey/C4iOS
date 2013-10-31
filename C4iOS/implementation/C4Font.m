//
//  C4Font.m
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

#import "C4Font.h"

@implementation C4Font
@synthesize UIFont = _UIFont, CTFont = _CTFont, CGFont = _CGFont, familyName = _familyName,
fontName = _fontName, pointSize = _pointSize, ascender = _ascender, descender = _descender,
capHeight = _capHeight, xHeight = _xHeight, lineHeight = _lineHeight;

-(id)init {
    self = [super init];
    if(self != nil) {
        _UIFont = [UIFont systemFontOfSize:12.0f];
        [self setup];
    }
    return self;
}

-(id)initWithName:(NSString *)fontName size:(CGFloat)fontSize {
    self = [super init];
    if(self != nil) {
        _UIFont = [UIFont fontWithName:fontName size:fontSize];
        [self setup];
    }
    return self;
}

+(C4Font *)fontWithName:(NSString *)fontName size:(CGFloat)fontSize {
    return [[C4Font alloc] initWithName:fontName size:fontSize];
}

-(void)dealloc {
    _UIFont = nil;
    _CTFont = nil;
    _CGFont = nil;
    _familyName = nil;
    _fontName = nil;
}

// Returns an array of font family names for all installed fonts
+(NSArray *)familyNames {
    return [UIFont familyNames];
}
// Returns an array of font names for the specified family name
+(NSArray *)fontNamesForFamilyName:(NSString *)familyName {
    return [UIFont fontNamesForFamilyName:familyName];
}

// Some convenience methods to create system fonts
+(C4Font *)systemFontOfSize:(CGFloat)fontSize {
    return [[C4Font alloc] initWithName:SYSTEMFONTNAME size:fontSize];
}

+(C4Font *)boldSystemFontOfSize:(CGFloat)fontSize {
    return [[C4Font alloc] initWithName:BOLDSYSTEMFONTNAME size:fontSize];
}
+(C4Font *)italicSystemFontOfSize:(CGFloat)fontSize {
    return [[C4Font alloc] initWithName:ITALICSYSTEMFONTNAME size:fontSize];
}

// Font attributes

// Create a new font that is identical to the current font except the specified size
-(C4Font *)fontWithSize:(CGFloat)fontSize {
    return [[C4Font alloc] initWithName:[self.UIFont fontName] size:fontSize];
}

-(NSString *)familyName {
    return _UIFont.familyName;
}

-(NSString *)fontName {
    return _UIFont.fontName;
}

-(void)setFontName:(NSString *)fontName {
    _UIFont = [UIFont fontWithName:fontName size:self.pointSize];
}

-(CGFloat)pointSize {
    return _UIFont.pointSize;
}

-(void)setPointSize:(CGFloat)pointSize {
    _UIFont = [UIFont fontWithName:self.fontName size:pointSize];
}

-(CGFloat)ascender {
    return _UIFont.ascender;
}

-(CGFloat)descender {
    return _UIFont.descender;
}

-(CGFloat)capHeight {
    return _UIFont.capHeight;
}

-(CGFloat)xHeight {
    return _UIFont.xHeight;
}

-(CGFloat)lineHeight {
    return _UIFont.lineHeight;
}

-(CGFontRef)CGFont {
    return (__bridge CGFontRef)self.UIFont;
}

-(CTFontRef)CTFont {
    return CTFontCreateWithName((__bridge CFStringRef)self.fontName, self.pointSize, nil);
}

-(C4Font *)copyWithZone:(NSZone *)zone {
    return [[C4Font allocWithZone:zone] initWithName:self.fontName size:self.pointSize];
}

@end