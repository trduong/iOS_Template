//
//  AppDelegate.m
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
//

#import <FacebookSDK/FacebookSDK.h>
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "ProfileViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;
@synthesize loginController = _loginController;
@synthesize profileViewController = _profileViewController;

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	  // load Parse
    [Parse setApplicationId:@"___VARIABLE_ParseAppID:identifier___"
                  clientKey:@"___VARIABLE_ParseClientKey:identifier___"];

    // initialize Parse/Facebook integration
    [PFFacebookUtils initializeFacebook];

    // set up Parse analytics
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];

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

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [PFFacebookUtils handleOpenURL:url];
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

- (void)sessionStateChanged
{
    if([PFUser currentUser]) {
        [self _constructLoggedInUI];
    } else {
        [self _constructLoggedOutUI];
    }
}

-(void)openSession
{
    [self sessionStateChanged];
}

-(void)closeSession
{
    // close the user's session
    [PFUser logOut];

    // reset the UI to be in a logged out state
    [self sessionStateChanged];
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

// this is called when the app is logged in
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
    // hide the tab bar when showing the login screen
    self.tabBarController.tabBar.hidden = YES;

    // create the Parse login controller
    LoginViewController *logInController = [[LoginViewController alloc] init];
    logInController.fields = PFLogInFieldsUsernameAndPassword | PFLogInFieldsFacebook | PFLogInFieldsLogInButton | PFLogInFieldsSignUpButton | PFLogInFieldsPasswordForgotten;
    logInController.delegate = self;

    // add the Parse login controller to the tab bar controller
    NSArray *controllers = [NSArray arrayWithObjects:logInController, nil];
    self.tabBarController.viewControllers = controllers;
}

#pragma mark - PFLogInViewControllerDelegate implementation

-(void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error
{
    NSLog(@"Login error");
}

-(void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user
{
    [self openSession];
}

-(void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController
{
    NSLog(@"User canceled the login");
}

-(void) _customizeIPhoneTheme
{
    // placeholder function for adding pretty UI to your app
    // follows the design pattern used by some of the best iPhone themes for solo developers:
    // http://www.appdesignvault.com
}

@end
