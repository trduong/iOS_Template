//
//  AppDelegate.h
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
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

// public methods to open and close Facebook sessions
-(void)openSession;
-(void)closeSession;

@end
