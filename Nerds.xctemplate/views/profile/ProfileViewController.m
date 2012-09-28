//
//  ProfileViewController.m
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
//

#import <FacebookSDK/FacebookSDK.h>
#import "User.h"
#import "APIClient.h"
#import "ProfileViewController.h"
#import "ProfileCell.h"

@implementation ProfileViewController

-(id)init
{
  // call the superclass's initializer
  self = [super initWithStyle:UITableViewStyleGrouped];
  
  if(self) {
    // set the title of the nav bar
    UINavigationItem *navItem = [self navigationItem];
    [navItem setTitle:@"Profile"];
    
    // now create a logout button for the left nav bar button area
    [[self navigationItem] setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStyleBordered target:self action:@selector(logoutButtonWasPressed:)]];
    
    // set the tab bar title information
    UITabBarItem* tbi = [self tabBarItem];
    [tbi setTitle:@"Profile"];
    UIImage* tb_image = [UIImage imageNamed:@"Profile.png"];
    [tbi setImage:tb_image];
  }
  
  return self;
}

-(void)viewDidLoad
{
}

-(void)logoutButtonWasPressed:(id)sender
{
  [FBSession.activeSession closeAndClearTokenInformation];
}

- (id)initWithStyle:(UITableViewStyle)style
{
  return [self init];
}

-(void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  
  // reload all the table data
  [[self tableView] reloadData];
}

#pragma mark - Table view data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  if(section == 0)
    return 2;
  else
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 2;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
  if(section == 0)
    return @"Adding Friends to Lists";
  else if (section == 1)
    return @"Let Us Know How We're Doing";
  else
    return @"Placeholder";
}

-(void)emailSwitchChanged:(id)sender {
  UISwitch *switchControl = sender;
  [[User currentUser] setNotifyByEmail:switchControl.on];
  [[APIClient shared] saveUserToServer];
}

-(void)textSwitchChanged:(id)sender {
  UISwitch *switchControl = sender;
  [[User currentUser] setNotifyByText:switchControl.on];
  [[APIClient shared] saveUserToServer];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  if(indexPath.section == 0)
  {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SwitchCell"];
    UISwitch *switchView;
    if(cell == nil) {
      cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SwitchCell"];
      cell.selectionStyle = UITableViewCellSelectionStyleNone;
      switchView = [[UISwitch alloc] initWithFrame:CGRectZero];
      cell.accessoryView = switchView;
    }
    
    switch(indexPath.row)
    {
      case 0:
        cell.textLabel.text = @"Invite via Text";
        [switchView setOn:[[User currentUser] notifyByText]];
        [switchView addTarget:self action:@selector(textSwitchChanged:) forControlEvents:UIControlEventValueChanged];
        break;
      case 1:
        cell.textLabel.text = @"Invite via Email";
        [switchView setOn:[[User currentUser] notifyByEmail]];
        [switchView addTarget:self action:@selector(emailSwitchChanged:) forControlEvents:UIControlEventValueChanged];
        break;
    }
    
    return cell;
  } else {
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(cell == nil) {
      cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.text = @"Provide Feedback";
    
    return cell;
  }
}

// wire up cell activity
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSLog(@"Selected: %d", indexPath.row);
}

@end
