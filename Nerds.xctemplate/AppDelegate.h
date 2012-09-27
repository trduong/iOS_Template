//
//  CSAppDelegate.h
//  CoolspotApp
//
//  Created by Prashant Sridharan on 8/15/12.
//  Copyright (c) 2012 Prashant Sridharan. All rights reserved.
//

#import <UIKit/UIKit.h>

// we want to make sure the data is displayed any time the user logs in or out from Facebook. We use this to get notified when the state of hte active session changes...
extern NSString *const SessionStateChangedNotification;

// all of your view controller classes that will be visible in tab views go here
@class LoginViewController;
@class ProfileViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// login controller
@property (strong, nonatomic) LoginViewController *loginController;

// tab bars, starting with the controller, then each one
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) ProfileViewController *profileViewController;

// you'll put all your logic for skinning the app here
-(void)customizeiPhoneTheme;

// the callback from the login view controller
-(void)openSession;

@end
