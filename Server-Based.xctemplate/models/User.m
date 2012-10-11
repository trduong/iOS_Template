//
//  User.m
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
//

#import "User.h"
#import "APIClient.h"

static User *currentUser = nil;

@implementation User

@synthesize firstName;
@synthesize lastName;
@synthesize email;
@synthesize userID;
@synthesize facebookID;
@synthesize notifyByEmail;
@synthesize notifyByText;
@synthesize deviceToken;
@synthesize facebookToken;

-(id)init
{
    self = [super init];
    
    if(self)
    {
        self.userID = 0;
        self.firstName = nil;
        self.lastName = nil;
        self.email = nil;
        self.facebookID = nil;
        self.notifyByEmail = true;
        self.notifyByText = true;
        self.deviceToken = nil;
        self.facebookToken = nil;
    }
    
    return self;
}

-(id)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    if(self)
    {
        self.userID = [[dict objectForKey:@"id"] integerValue];
        self.firstName = [dict objectForKey:@"first_name"];
        self.lastName = [dict objectForKey:@"last_name"];
        self.email = [dict objectForKey:@"email"];
        self.facebookID = [dict objectForKey:@"facebook_id"];
        self.notifyByEmail = [[dict objectForKey:@"notify_email"] boolValue];
        self.notifyByText = [[dict objectForKey:@"notify_text"] boolValue];
        self.deviceToken = [dict objectForKey:@"device_token"];
    }
    
    return self;
}

+(void)setCurrentUser:(NSDictionary*)dict
{
    currentUser = [[User alloc] initWithDictionary:dict];
}

+(User*)currentUser
{
    return currentUser;
}

#pragma mark - Authentication Token

+(void)clearAuthenticationToken
{
    [User setAuthenticationToken:nil];
}

+(BOOL)loggedIn
{
    return (nil != [User authenticationToken]);
}

+(NSString*)authenticationToken
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"X-AUTHENTICATION-TOKEN"];
}

// TODO:
// Move this into the keychain.
+(void)setAuthenticationToken:(NSString*)aToken
{
    [[NSUserDefaults standardUserDefaults] setObject:aToken forKey:@"X-AUTHENTICATION-TOKEN"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[APIClient shared] setAuthenticationToken:aToken];
}

@end
