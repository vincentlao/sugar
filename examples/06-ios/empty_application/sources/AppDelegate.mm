// Copyright (c) 2013, Ruslan Baratov
// All rights reserved.

#import "AppDelegate.hpp"

#include <boost/concept_check.hpp> // boost::ignore_unused_variable_warning

#import <UIKit/UIScreen.h> // UIScreen
#import <UIKit/UIWindow.h> // UIWindow _window

@implementation AppDelegate

@synthesize window = _window;

// UIApplicationDelegate implementation
- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  boost::ignore_unused_variable_warning(application);
  boost::ignore_unused_variable_warning(launchOptions);
  self.window = [
      [UIWindow alloc]
      initWithFrame:[[UIScreen mainScreen] bounds]
  ];
  // Override point for customization after application launch.
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
  boost::ignore_unused_variable_warning(application);
  // Sent when the application is about to move from active to inactive
  // state. This can occur for certain types of temporary interruptions
  // (such as an incoming phone call or SMS message) or when the user
  // quits the application and it begins the transition to the background
  // state. Use this method to pause ongoing tasks, disable timers, and
  // throttle down OpenGL ES frame rates. Games should use this method
  // to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  boost::ignore_unused_variable_warning(application);
  // Use this method to release shared resources, save user data,
  // invalidate timers, and store enough application state information
  // to restore your application to its current state in case it is
  // terminated later.
  // If your application supports background execution,
  // this method is called instead of applicationWillTerminate:
  // when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  boost::ignore_unused_variable_warning(application);
  // Called as part of the transition from the background to the inactive
  // state; here you can undo many of the changes made on entering
  // the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  boost::ignore_unused_variable_warning(application);
  // Restart any tasks that were paused (or not yet started) while
  // the application was inactive. If the application was previously
  // in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
  boost::ignore_unused_variable_warning(application);
  // Called when the application is about to terminate.
  // Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
