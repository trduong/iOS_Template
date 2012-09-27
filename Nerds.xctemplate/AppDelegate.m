//
//  AppDelegate.m
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
//

#import <FacebookSDK/FacebookSDK.h>
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"
#import "APIClient.h"
#import "AppDelegate.h"
#import "User.h"

@implementation AppDelegate

@synthesize tabBarController = _tabBarController;

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
}

// the base foundation UI
-(void) _constructBaseUI
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // construct the tab bar
    self.tabBarController = [[UITabBarController alloc] init];
    
    // place the ItemsViewController in the window hierarchy
    [[self window] setRootViewController:self.tabBarController];
    
    [self.window makeKeyAndVisible];
}

-(void)sessionStateChanged:(FBSession *)session state:(FBSessionState) state error:(NSError *)error
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

// execute the Facebook signin and render views
-(void) openSession
{
    // setup permissions list first
    // note that all permissions during the login phase MUST be read-only
    // later on, when your app needs to publish back to Facebook, you should use:
    // reauthorizeWithPublishPermissions:defaultAudience:completionHandler:
    NSMutableArray *permissions = [[NSMutableArray alloc] init];
    [permissions addObject:@"email"];
  
    // now open the session with the permissions list
    [FBSession openActiveSessionWithReadPermissions:permissions allowLoginUI:YES completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
      [self sessionStateChanged:session state:status error:error];
    }];
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
    
}

// this is called when the app is logged out
-(void) _constructLoggedOutUI
{
    
}

-(void) _customizeIPhoneTheme
{
    
}


@end
