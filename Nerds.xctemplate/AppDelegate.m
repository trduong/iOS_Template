//
//  CSAppDelegate.m
//  CoolspotApp
//
//  Created by Prashant Sridharan on 8/15/12.
//  Copyright (c) 2012 Prashant Sridharan. All rights reserved.
//

#import <FacebookSDK/FacebookSDK.h>
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"
#import "APIClient.h"
#import "AppDelegate.h"
#import "User.h"
#import "LoginViewController.h"
#import "ProfileViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;
@synthesize loginController = _loginController;
@synthesize profileViewController = _profileViewController;

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self _customizeIPhoneTheme];
    
    [self _constructBaseUI];
    
    // we want to see if we have a valid Facebook authentication token for the current state
    if(FBSession.activeSession.state == FBSessionStateCreatedTokenLoaded) {
        // show the logged in view, this won't display any new UI
        [self openSession];
    } else {
        // display the login page
        [self _constructLoggedOutUI];
    }
  
  return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  
  // this means the user interrupted the Facebook login somehow (e.g., clicking on the Home button)
  if(FBSession.activeSession.state == FBSessionStateCreatedOpening) {
    // close the session and start over
    [FBSession.activeSession close];
  }
}

- (void)sessionStateChanged:(FBSession *)session
                      state:(FBSessionState) state
                      error:(NSError *)error
{
  switch (state) {
    case FBSessionStateOpen:
      [self _loadCurrentUser:session.accessToken];
      break;
    case FBSessionStateClosed:
    case FBSessionStateClosedLoginFailed:
      [FBSession.activeSession closeAndClearTokenInformation];
      [self _constructLoggedOutUI];
      break;
    default:
      break;
  }

  if (error) {
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Error"
                              message:error.localizedDescription
                              delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    [alertView show];
  }
}

- (void)openSession
{
  // setup permissions list first
  NSMutableArray *permissions = [[NSMutableArray alloc] init];
  [permissions addObject:@"email"];
  
  // now open the session with the permissions list
  [FBSession openActiveSessionWithReadPermissions:permissions allowLoginUI:YES completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
    [self sessionStateChanged:session state:status error:error];
  }];
}

// for Facebook login flow, control is temporarily transferred to the Facebook iOS app...once it authenticates for you, it calls this delegate back
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
  return [FBSession.activeSession handleOpenURL:url];
}

// the base foundation UI
-(void) _constructBaseUI
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // construct the tab bar
    self.tabBarController = [[UITabBarController alloc] init];
    
    // place the tab bar controller in the window hierarchy
    [[self window] setRootViewController:self.tabBarController];
    
    [self.window makeKeyAndVisible];
}

-(void) _loadCurrentUser:(NSString *)token
{
    // set the Facebook access token
    [[APIClient shared] createSessionWithFBAccessToken:token success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [User setAuthenticationToken:[[operation.response allHeaderFields] objectForKey:@"X-AUTHENTICATION-TOKEN"]];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error creating session with Facebook token: %@", error);
    }];
    
    // load the current user
    [[APIClient shared] getMe:^(AFHTTPRequestOperation *operation, id responseObject) {
        [User setCurrentUser:responseObject];
        [[User currentUser] setFacebookToken:token];
        
        // register for Push Notifications
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
        
        [self _constructLoggedInUI];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Couldn't load the user.");
    }];
}

-(void) _constructLoggedInUI
{
  // construct the profile view
  self.profileViewController = [[ProfileViewController alloc] init];
  UINavigationController *profileNavController = [[UINavigationController alloc] initWithRootViewController:self.profileViewController];
  
  // add the tab view controllers to the tab bar controller, the last item should be nil
  NSArray* controllers = [NSArray arrayWithObjects:profileNavController, nil];
  self.tabBarController.viewControllers = controllers;
  
  // display the tab bar
  self.tabBarController.tabBar.alpha = 0;
  self.tabBarController.tabBar.hidden = NO;
  
  // do some fancy animation
  [UIView animateWithDuration:0.2 animations:^{
    self.tabBarController.tabBar.alpha = 1.f;
  }];

}

// this is called when the app is logged out
-(void) _constructLoggedOutUI
{
  self.loginController = [[LoginViewController alloc] init];
  NSArray* controllers = [NSArray arrayWithObjects:self.loginController, nil];
  self.tabBarController.viewControllers = controllers;
  self.tabBarController.tabBar.hidden = YES;
}

-(void) _customizeIPhoneTheme
{
    
}

@end
