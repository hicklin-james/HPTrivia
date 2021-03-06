//
//  HPTAppDelegate.m
//  HPTrivia
//
//  Created by James Hicklin on 2013-08-20.
//  Copyright (c) 2013 James Hicklin. All rights reserved.
//

#import "HPTAppDelegate.h"

@implementation HPTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
  UIStoryboard *storyboard;
  if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
  {
    storyboard = [UIStoryboard storyboardWithName:@"hp-ipad" bundle:[NSBundle mainBundle]]; /* Device is iPad */
  }
  else {
  storyboard = [UIStoryboard storyboardWithName:@"hp-iphone" bundle:[NSBundle mainBundle]];
  }
  UIViewController *vc =[storyboard instantiateInitialViewController];
  
  // Set root view controller and make windows visible
  self.window.rootViewController = vc;
  [self.window makeKeyAndVisible];
  
  NSString *destPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
  destPath = [destPath stringByAppendingPathComponent:@"highScore.plist"];
  // If the file doesn't exist in the Documents Folder, copy it.
  NSFileManager *fileManager = [NSFileManager defaultManager];
  
  if (![fileManager fileExistsAtPath:destPath]) {
    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"highScore" ofType:@"plist"];
    [fileManager copyItemAtPath:sourcePath toPath:destPath error:nil];
  }
  
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
