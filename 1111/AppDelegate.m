//
//  AppDelegate.m
//  1111
//
//  Created by apple on 15/9/16.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewControllerA.h"
//#import "ViewControllerB.h"
//#import "ViewControllerC.h"
#import "ViewControllerD.h"
#import "ViewControllerE.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    CGRect frame = [UIScreen mainScreen].bounds;
    self.window = [[UIWindow alloc]initWithFrame:frame];
    self.window.backgroundColor = [UIColor whiteColor];

  //  ViewControllerA *viewCtrl1 = [[ViewControllerA alloc]init];
    
    
    ViewControllerA *vc1 = [ViewControllerA new];
    ViewControllerD *vc2 = [ViewControllerD new];
    ViewControllerE *vc3 = [ViewControllerE new];
    UINavigationController *navCtrller = [[UINavigationController alloc] initWithRootViewController:vc1];
    UITabBarController *tabBarCtr = [[UITabBarController alloc]init];
    
    
    navCtrller.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"任务" image:[UIImage imageNamed:@"12.File-128.png"] selectedImage:[UIImage imageNamed:@"12.File-128.png"]];
    tabBarCtr.viewControllers = @[navCtrller,vc2,vc3];
    
    self.window.rootViewController = tabBarCtr;
    [self.window makeKeyAndVisible];
    return YES;
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
