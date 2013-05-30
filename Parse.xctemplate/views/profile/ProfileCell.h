//
//  ProfileCell.h
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProfileCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *profileTopic;
@property (weak, nonatomic) IBOutlet UISwitch *profileStatus;

@end
