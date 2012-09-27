//
//  ProfileCell.h
//  CoolspotApp
//
//  Created by Prashant Sridharan on 9/26/12.
//  Copyright (c) 2012 Prashant Sridharan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProfileCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *profileTopic;
@property (weak, nonatomic) IBOutlet UISwitch *profileStatus;

@end
