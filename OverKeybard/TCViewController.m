//
//  TCViewController.m
//  OverKeybard
//
//  Created by Joachim Bengtsson on 2012-10-06.
//  Copyright (c) 2012 Joachim Bengtsson. All rights reserved.
//

#import "TCViewController.h"
#import "TCAHPSimpleClient.h"

@interface TCViewController ()
{
    TCAHPSimpleClient *_client;
}

@end

@implementation TCViewController
- (id)init
{
    if(!(self = [super init]))
        return nil;
    _client = [[TCAHPSimpleClient alloc] initConnectingToAnyHostOfType:@"_tckeyboard._tcp" delegate:(id)self];
    return self;
}

- (IBAction)keyDown:(UIView*)sender
{
    [_client.proto sendHash:@{
        @"command": @"keyEvent",
        @"keyCode": @(sender.tag),
        @"down": @YES
    }];
}

- (IBAction)keyUp:(UIView*)sender
{
    [_client.proto sendHash:@{
        @"command": @"keyEvent",
        @"keyCode": @(sender.tag),
        @"down": @NO
    }];
}

@end
