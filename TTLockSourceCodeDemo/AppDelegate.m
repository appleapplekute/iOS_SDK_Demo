//
//  AppDelegate.m
//  TTLockSourceCodeDemo
//
//  Created by Jinbo Lu on 2019/4/4.
//  Copyright © 2019 Sciener. All rights reserved.
//

#import "AppDelegate.h"
#import "UserModel.h"
#import "RootViewController.h"
#import "LoginViewController.h"
#import "NavigationController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [TTLock setupBluetooth:^(TTBluetoothState state) {
        NSLog(@"##############  TTLock is working, bluetooth state: %ld  ##############",(long)state);
    }];
    
    [self showWindowRootViewController];
    return YES;
}

- (void)showWindowRootViewController{
    _window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    _window.backgroundColor = UIColor.whiteColor;
    [_window makeKeyAndVisible];
    
    if ([UserModel isLogin]) {
        [self showLockTableViewController];
    }else{
        [self showLoginViewController];
    }
}

- (void)showLoginViewController{
    _window.rootViewController = [LoginViewController new];
}

- (void)showLockTableViewController{
    NavigationController *naviegationController = [[NavigationController alloc] initWithRootViewController:[RootViewController new]];
    _window.rootViewController = naviegationController;
}


@end
