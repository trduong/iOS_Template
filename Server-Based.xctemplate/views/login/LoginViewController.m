//
//  LoginViewController.m
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"

@implementation LoginViewController

@synthesize spinner;
@synthesize loginView = _loginView;

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

    // TODO: only ask for permissions you really need
    // For more information about permissions: https://developers.facebook.com/docs/reference/login/#permissions
    self.loginView.readPermissions = @[@"email", @"user_likes"];
    self.loginView.delegate = self;
}

-(void)viewDidUnload
{
    [self setSpinner:nil];
    [super viewDidUnload];
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)loginFailed
{
    // User switched back to the app without authorizing. Stay here, but stop the spinner.
    [self.spinner stopAnimating];
}

// FBLoginViewDelegate
-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user
{
    NSLog(@"[FBLoginView:FBLoginViewDelegate:loginViewFetchedUserInfo] The user has logged in");

    // start animating the spinner
    [self.spinner startAnimating];

    // create the delegate and open the Facebook session
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    [appDelegate openSession];
}

@end
