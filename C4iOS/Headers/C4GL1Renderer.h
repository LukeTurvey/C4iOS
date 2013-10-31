//
//  C4GL1Renderer.h
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

#import "C4EAGLES1Renderer.h"
/**This document describes the C4GL1Renderer class which should be used / subclassed to create your own rendering algorithms for a [C4GL](C4GL) object.
 
 Instead of manipulating this object's initialization methods, you can instantiate variables using the setup method. The setup method gets called at the end of the init method executed by the superclass [C4EAGLES1Renderer](C4EAGLES1Renderer).
 */
@interface C4GL1Renderer : C4EAGLES1Renderer
#pragma mark - Setup & Render
///@name Setup & Render
/**The method to override for adding additional variable setup.
 
 This method gets called automatically at the end of the object's initialization.
 
 @warning Do NOT override initialization methods such as - (id)init, instead override this method.
 */
-(void)setup;

/**The method to override for adding custom drawing calls.
  */
-(void)render;

#pragma mark - Copying
///@name Copying
/**Creates a copy of the receiver.
 @param zone The zone for copying. Leave this as nil for normal results.
 @return a copy of the receiver.
 */
-(C4GL1Renderer *)copyWithZone:(NSZone *)zone;

@end
