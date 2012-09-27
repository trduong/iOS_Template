//
//  User.h
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property(strong) NSString *firstName;
@property(strong) NSString *lastName;
@property(strong) NSString *email;
@property NSInteger userID;
@property(strong) NSString *facebookID;
@property BOOL notifyByEmail;
@property BOOL notifyByText;
@property (strong) NSString *deviceToken;
@property (strong) NSString *facebookToken;

+(void)setCurrentUser:(NSDictionary *)dict;
+(User *)currentUser;
+(void)setAuthenticationToken:(NSString *)token;
+(NSString *)authenticationToken;
+(void)clearAuthenticationToken;

@end
