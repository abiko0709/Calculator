//
//  AppDelegate.m
//  Calculator2
//
//  Created by abi on 2019/03/04.
//  Copyright © 2019 abi. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewMain.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize window;
@synthesize mainView;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //    UIwindowの生成
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor lightTextColor];
    
    self.mainView = [[ViewMain alloc] initWithNibName:@"ViewMain" bundle:nil];
    
    //    最初に表示したいViewControllerを指定してインスタンスを生成する
    UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:self.mainView];
    self.window.rootViewController = nc;
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
//    アプリ閉じそうな時に呼ばれる
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//    アプリを閉じた時に呼ばれる
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
//    アプリを閉じた時に呼ばれる
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//    アプリを開きそうな時に呼ばれる
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//    アプリを開いた時に呼ばれる
}


@end
