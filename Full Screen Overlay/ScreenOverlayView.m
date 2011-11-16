#define LogDebugMsg NSLog(@"<%p>%s:", self, __PRETTY_FUNCTION__)

#import "ScreenOverlayView.h"

@implementation ScreenOverlayView

- (BOOL)acceptsFirstResponder {return YES;}
- (BOOL)becomeFirstResponder {return YES;}
- (BOOL)canBecomeKeyWindow {return YES;}

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		// no need for this: everything is initialized to 0's or nil during init.
		// (In other words, the code below is simply redundant)
		
//        // Initialization code here.
//        downLocation = CGPointMake(0, 0);
//        downLocation = CGPointMake(0, 0);
//        drawing = NO;
    }
    return self;
}

- (void)viewDidMoveToWindow {
    LogDebugMsg;
//    [self updateTrackingAreas];
}


- (void)updateTrackingAreas
{
    // This is called when the window is resized
    LogDebugMsg;
    // Setup a new tracking area when the view is added to the window.
    NSTrackingArea* trackingArea = [[NSTrackingArea alloc] initWithRect:[self frame] 
                                                           options: (NSTrackingMouseEnteredAndExited | NSTrackingActiveInActiveApp | NSTrackingCursorUpdate) 
                                                           owner:self userInfo:nil];
    [self addTrackingArea:trackingArea];
    [trackingArea release];
}

- (void)viewDidLoad {
    LogDebugMsg;
    [NSCursor hide];
}

- (void)mouseEntered:(NSEvent *)theEvent {
    LogDebugMsg;
    [[NSCursor crosshairCursor] push];
}

- (void)mouseExited:(NSEvent *)theEvent {
    LogDebugMsg;
    [[NSCursor crosshairCursor] pop];
}

- (void)mouseMoved:(NSEvent *)theEvent {
    LogDebugMsg;
//    [[NSCursor crosshairCursor] set];
    
}
-(void)cursorUpdate:(NSEvent *)theEvent
{
    LogDebugMsg;
    [[NSCursor crosshairCursor] set];
}

- (void) resetCursorRects
{
    LogDebugMsg;
//    [super resetCursorRects];
    [self addCursorRect: [self bounds]
                 cursor: [NSCursor crosshairCursor]];
    
} 


- (void)drawRect:(NSRect)rect {
	// below should probably be "pre-multiplied" by the alpha
//	[[NSColor colorWithCalibratedRed:1.0 green:0.0 blue:0.0 alpha:0.8] set];
	
	// premultiplied version:
	
	[[NSColor colorWithCalibratedRed:0.8 green:0.0 blue:0.0 alpha:0.8] set];
	[NSBezierPath setDefaultLineWidth:2.0];
	[NSBezierPath strokeLineFromPoint:currentLocation toPoint:downLocation];
	
}

- (void)mouseUp:(NSEvent *)event {
    NSLog(@"<%p>%s:", self, __PRETTY_FUNCTION__);
    [self setNeedsDisplay:YES];    
    drawing = NO;
}

- (void)mouseDown:(NSEvent *)event{
    downLocation = [self convertPoint:[event locationInWindow] fromView:[[self window] contentView]];
    currentLocation = [self convertPoint:[event locationInWindow] fromView:[[self window] contentView]];
    drawing = YES;
	[self setNeedsDisplay:YES];
}

-(void)mouseDragged:(NSEvent *)event {   
    currentLocation = [self convertPoint:[event locationInWindow] fromView:[[self window] contentView]];
	[self setNeedsDisplay:YES];
}






@end
