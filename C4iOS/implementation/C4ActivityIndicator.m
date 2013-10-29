//
//  C4ActivityIndicator.m
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

#import "C4ActivityIndicator.h"

@implementation C4ActivityIndicator
@synthesize color = _color;

+ (C4ActivityIndicator *)indicatorWithStyle:(C4ActivityIndicatorStyle)style {
    C4ActivityIndicator *indicator = [[C4ActivityIndicator alloc] initWithActivityIndicatorStyle:style];
    return indicator;
}

- (id)initWithActivityIndicatorStyle:(C4ActivityIndicatorStyle)style {
    self = [super init];
    if(self != nil) {
        _UIActivityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style];
        self.frame = _UIActivityIndicatorView.frame;
        [self setupFromDefaults];
        [self addSubview:_UIActivityIndicatorView];
    }
    return self;
}

- (void)setupFromDefaults {
    _UIActivityIndicatorView.hidesWhenStopped = YES;
    _UIActivityIndicatorView.color = [C4ActivityIndicator defaultStyle].color;
}

- (void)startAnimating {
    [self.UIActivityIndicatorView startAnimating];
}

- (void)stopAnimating {
    [self.UIActivityIndicatorView stopAnimating];
}

- (BOOL)isAnimating {
    return self.UIActivityIndicatorView.isAnimating;
}

- (void)setActivityIndicatorStyle:(C4ActivityIndicatorStyle)style {
    self.activityIndicatorStyle = style;
}

- (C4ActivityIndicatorStyle)activityIndicatorStyle {
    return (C4ActivityIndicatorStyle)_UIActivityIndicatorView.activityIndicatorViewStyle;
}

- (void)setHidesWhenStopped:(BOOL)hidesWhenStopped {
    _UIActivityIndicatorView.hidesWhenStopped = hidesWhenStopped;
}

- (BOOL)hidesWhenStopped {
    return _UIActivityIndicatorView.hidesWhenStopped;
}

- (void)setColor:(UIColor *)color {
    _color = color;
    self.UIActivityIndicatorView.color = color;
}

- (UIColor *)color {
    return _UIActivityIndicatorView.color;
}

#pragma mark Style
+ (C4ActivityIndicator *)defaultStyle {
    return ((C4ActivityIndicator *)[C4ActivityIndicator appearance]);
}

- (NSDictionary *)style {
    //mutable local styles
    NSMutableDictionary *localStyle = [[NSMutableDictionary alloc] initWithCapacity:0];
    [localStyle addEntriesFromDictionary:@{@"indicator":self.UIActivityIndicatorView}];
    
    NSDictionary *controlStyle = [super style];
    
    NSMutableDictionary *localAndControlStyle;
    localAndControlStyle = [NSMutableDictionary dictionaryWithDictionary:localStyle];
    [localAndControlStyle addEntriesFromDictionary:controlStyle];
    
    localStyle = nil;
    controlStyle = nil;
    
    return (NSDictionary *)localAndControlStyle;
}

- (void)setStyle:(NSDictionary *)newStyle {
    self.color = nil;
    
    [super setStyle:newStyle];
    
    UIActivityIndicatorView *indicator = [newStyle objectForKey:@"indicator"];
    if(indicator != nil) {
        _UIActivityIndicatorView.color = indicator.color;
        indicator = nil;
    }
}

#pragma mark isEqual

- (BOOL)isEqual:(id)object {
    BOOL equalValue = NO;
    if([object isKindOfClass:[UIActivityIndicatorView class]]) {
        equalValue = [self.UIActivityIndicatorView isEqual:object];
    }
    else if([object isKindOfClass:[self class]]) {
        equalValue = [self.UIActivityIndicatorView
                      isEqual:((C4ActivityIndicator *)object).UIActivityIndicatorView];
        
    }
    return equalValue;
}

- (void)runMethod:(NSString *)methodName target:(id)object forEvent:(C4ControlEvents)event{
    methodName = methodName;
    object = object;
    event = event;
}

- (void)stopRunningMethod:(NSString *)methodName target:(id)object forEvent:(C4ControlEvents)event {
    methodName = methodName;
    object = object;
    event = event;
}
@end
