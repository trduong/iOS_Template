//
//  LoginViewController.m
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"

@interface LoginViewController()

- (IBAction)performLogin:(id)sender;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation LoginViewController

@synthesize spinner;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
  [self setSpinner:nil];
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)loginFailed
{
  // User switched back to the app without authorizing. Stay here, but stop the spinner.
  [self.spinner stopAnimating];
}

- (IBAction)performLogin:(id)sender {
  // start animating the spinner
  [self.spinner startAnimating];
  
  // create the delegate and open the Facebook session
  AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
  [appDelegate openSession];
}

@end
