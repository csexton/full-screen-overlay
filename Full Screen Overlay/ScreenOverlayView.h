#import <Cocoa/Cocoa.h>

@interface ScreenOverlayView : NSView {
	NSPoint currentLocation;
	NSPoint downLocation;
	
    BOOL drawing;
}



@end
