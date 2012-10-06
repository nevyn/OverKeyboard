//
//  TCAppDelegate.h
//  OverKeybard
//
//  Created by Joachim Bengtsson on 2012-10-06.
//  Copyright (c) 2012 Joachim Bengtsson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TCViewController;

@interface TCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) TCViewController *viewController;

@end
