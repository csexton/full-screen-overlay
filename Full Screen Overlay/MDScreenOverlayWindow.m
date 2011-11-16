//
//  MDScreenOverlayWindow.m
//  Full Screen Overlay
//
//  Created by Mark Douma on 11/15/2011.
//  Copyright (c) 2011 Mark Douma LLC. All rights reserved.
//

#import "MDScreenOverlayWindow.h"



#define MD_DEBUG 1


@implementation MDScreenOverlayWindow

- (id)initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)windowStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)deferCreation {
#if MD_DEBUG
	NSLog(@"[%@ %@]", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
	NSRect screenRect = [[NSScreen mainScreen] frame];
	if ((self = [super initWithContentRect:NSMakeRect(screenRect.origin.x, screenRect.origin.y, NSWidth(screenRect) - 20.0, NSHeight(screenRect))
								styleMask:NSBorderlessWindowMask
								  backing:NSBackingStoreBuffered defer:deferCreation])) {
		[self setOpaque:NO];
        self.backgroundColor = [NSColor clearColor];
		[self setLevel:CGShieldingWindowLevel()];
	}
	return self;
}


// Windows created with NSBorderlessWindowMask normally can't be key, but we want ours to be
- (BOOL)canBecomeKeyWindow {
#if MD_DEBUG
	NSLog(@"[%@ %@]", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
    return YES;
}


@end
