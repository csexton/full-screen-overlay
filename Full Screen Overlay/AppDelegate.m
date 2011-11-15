//
//  AppDelegate.m
//  Full Screen Overlay
//
//  Created by Christopher Sexton.
//

#import "AppDelegate.h"
#import "ScreenOverlayView.h"

@implementation AppDelegate

@synthesize window;

- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    // Create the window
    NSRect frame = [[NSScreen mainScreen] frame];

    // Provide a small area on the right to move the cursor in-and-out of the window.
    frame.size.width = frame.size.width - 20; 
    self.window  = [[NSWindow alloc] initWithContentRect:frame
                                               styleMask:NSBorderlessWindowMask
                                                 backing:NSBackingStoreBuffered
                                                   defer:NO];
    

    [self.window setAcceptsMouseMovedEvents:YES];
    [self.window setOpaque:NO];
    [self.window setLevel:CGShieldingWindowLevel()];
    [self.window setBackgroundColor:[NSColor colorWithDeviceRed:0.0 green:0.0 blue:1.0 alpha:0.2]];
    
    // Create the subview
    ScreenOverlayView *subview = [[ScreenOverlayView alloc] initWithFrame:NSZeroRect];
    
    
    
    [[self.window contentView] addSubview:subview];
    [self.window setContentView:subview];
    
    [self.window makeFirstResponder:subview];
//    [self.window makeKeyAndOrderFront:NSApp];
    [self.window orderFrontRegardless];
    

}

@end
