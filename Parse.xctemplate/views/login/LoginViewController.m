//
//  LoginViewController.m
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
//

#import "LoginViewController.h"
#import "SignupViewController.h"
#import "AppDelegate.h"

@implementation LoginViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];

    // TODO: customize the UI for the login view

    // Instantiate our custom sign up view controller
    SignupViewController *signUpViewController = [[SignupViewController alloc] init];
    [signUpViewController setDelegate:self];
    [signUpViewController setFields:PFSignUpFieldsDefault];

    // Link the sign up view controller
    [self setSignUpController:signUpViewController];
}

#pragma mark - SignUpViewControllerDelegate implementation

-(void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error
{
}

-(void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user
{
    // TODO: do anything else necessary to create/configure a new user

    // get rid of the view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
