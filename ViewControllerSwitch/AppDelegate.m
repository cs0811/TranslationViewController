//
//  AppDelegate.m
//  ViewControllerSwitch
//
//  Created by S on 15/11/27.
//  Copyright © 2015年 S. All rights reserved.
//

#import "AppDelegate.h"
#import "STranslationVC.h"
#import "SecondVC.h"
#import "ThirdVC.h"
#import "FourthVC.h"

@interface AppDelegate ()
@property (nonatomic,strong) SecondVC * second;
@property (nonatomic,strong) ThirdVC * third ;
@property (nonatomic,strong) FourthVC * fourth;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    _second = [[SecondVC alloc] init];
    _third = [[ThirdVC alloc] init];
    _fourth = [[FourthVC alloc] init];
    
    STranslationVC * translation = [[STranslationVC alloc] init];
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:translation];
    self.window.rootViewController = nav;
    
    // 配置属性
    translation.titleArray = @[@"第一个",@"第二个",@"第三个",@"第四个",@"第五个",@"第六个",@"第七个"];    // 当标题数多于视图数时，多余的标题不会被响应
    translation.translationViewControllers = @[_second,_third,_fourth];
    translation.firstViewController = _second;
        
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
