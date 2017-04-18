//
//  MDVerticallyCenteredTextFieldCell.m
//  TEST
//
//  Created by sycf_ios on 2017/4/18.
//  Copyright © 2017年 shibiao. All rights reserved.
//

#import "MDVerticallyCenteredTextFieldCell.h"

@implementation MDVerticallyCenteredTextFieldCell
- (NSRect)adjustedFrameToVerticallyCenterText:(NSRect)frame {
    // super would normally draw text at the top of the cell
    NSInteger offset = floor((NSHeight(frame)/2 -
                              ([[self font] ascender] + [[self font] descender])) );
    NSLog(@"%f ,%f ,%f",NSHeight(frame),self.font.ascender,self.font.descender);
    return NSInsetRect(frame, 0.0, offset);
}

- (void)editWithFrame:(NSRect)aRect inView:(NSView *)controlView
               editor:(NSText *)editor delegate:(id)delegate event:(NSEvent *)event {
    [super editWithFrame:[self adjustedFrameToVerticallyCenterText:aRect]
                  inView:controlView editor:editor delegate:delegate event:event];
}

- (void)selectWithFrame:(NSRect)aRect inView:(NSView *)controlView
                 editor:(NSText *)editor delegate:(id)delegate
                  start:(NSInteger)start length:(NSInteger)length {
    
    [super selectWithFrame:[self adjustedFrameToVerticallyCenterText:aRect]
                    inView:controlView editor:editor delegate:delegate
                     start:start length:length];
}

- (void)drawInteriorWithFrame:(NSRect)frame inView:(NSView *)view {
    [super drawInteriorWithFrame:
     [self adjustedFrameToVerticallyCenterText:frame] inView:view];
}
@end
