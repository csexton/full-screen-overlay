#import <Cocoa/Cocoa.h>

@interface ScreenOverlayView : NSView {
    CGPoint currentLocation;
    CGPoint downLocation;
    BOOL drawing;
}



@end
