//
//  TCAppDelegate.m
//  KeyboardDaemon
//
//  Created by Joachim Bengtsson on 2012-10-06.
//  Copyright (c) 2012 Joachim Bengtsson. All rights reserved.
//

#import "TCAppDelegate.h"
#import "TCAHPSimpleServer.h"

@implementation TCAppDelegate {
    TCAHPSimpleServer *_server;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSError *err;
    _server = [[TCAHPSimpleServer alloc] initOnBasePort:4982 serviceType:@"_tckeyboard._tcp" serviceName:@"TCKeyboard" delegate:self error:&err];
    NSAssert(_server, @":: %@", err);
}

- (void)command:(TCAsyncHashProtocol*)proto keyEvent:(NSDictionary*)hash
{
    int keyCode = [hash[@"keyCode"] intValue];
    BOOL isDown = [hash[@"down"] boolValue];
    CGEventRef event = CGEventCreateKeyboardEvent(NULL, (CGKeyCode)keyCode, isDown);
    CGEventPost(kCGHIDEventTap, event);
    CFRelease(event);
}
@end