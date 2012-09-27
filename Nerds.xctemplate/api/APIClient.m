//
//  APIClient.m
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
//

#import <FacebookSDK/FacebookSDK.h>
#import "APIClient.h"
#import "CSJSONRequestOperation.h"
#import "User.h"

//#define kBaseURLString @"http://localhost:3000"
#define kBaseURLString @"http://www.listemon.com"

@implementation APIClient

+(APIClient *)shared
{
    static APIClient *_sharedClient = nil;
    _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:kBaseURLString]];
    
    return _sharedClient;
}

-(id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (!self)
    {
        return nil;
    }
    
    [self registerHTTPOperationClass:[CSJSONRequestOperation class]];
    self.parameterEncoding = AFJSONParameterEncoding;
    [self setDefaultHeader:@"Accept" value:@"application/json"];
    [self setDefaultHeader:@"Content-Type" value:@"application/json"];
    
    return self;
}

-(void)setAuthenticationToken:(NSString *)token
{
    [self setDefaultHeader:@"X-AUTHENTICATION-TOKEN" value:token];
}

-(NSDictionary*)headers
{
    return [super performSelector:@selector(defaultHeaders)];
}

#pragma mark - /users

- (void)getMe:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    if (FBSession.activeSession.isOpen) {
        [[FBRequest requestForMe] startWithCompletionHandler:^(FBRequestConnection *connection, NSDictionary<FBGraphUser> *user, NSError *error) {
            if (!error) {
                NSString *userPath = [NSString stringWithFormat:@"%@/users/%@.json", kBaseURLString, user.id];
                [self getPath:userPath parameters:nil success:success failure:failure];
            }
        }];
    }
}

#pragma mark - /session

-(void)createSessionWithFBAccessToken:(NSString*)token
                              success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    // create the dictionary with the Facebook access token
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:token forKey:@"access_token"];
    
    // post the session
    [self postPath:@"/sessions/facebook" parameters:dict success:success failure:failure];
}

-(void)destroySession:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    [self deletePath:@"/sessions" parameters:nil success:success failure:failure];
}

#pragma mark - /users

-(void)saveUserToServer
{
    // create the dictionary to house the contents of this user
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    // set the dictionary object based on the user contents
    [dict setObject:[NSNumber numberWithInt:[User currentUser].userID] forKey:@"id"];
    [dict setObject:[User currentUser].facebookID forKey:@"facebook_id"];
    if([User currentUser].deviceToken != nil) {
        [dict setObject:[User currentUser].deviceToken forKey:@"device_token"];
    }
    [User currentUser].notifyByEmail ? [dict setObject:@"true" forKey:@"notify_email"] : [dict setObject:@"false" forKey:@"notify_email"];
    [User currentUser].notifyByText ? [dict setObject:@"true" forKey:@"notify_text"] : [dict setObject:@"false" forKey:@"notify_text"];
    
    // create the URL path to PUT to the server
    NSString *urlString = [NSString stringWithFormat:@"%@/users/%d/settings", kBaseURLString, [User currentUser].userID];
    
    // PUT (update) the user on the server
    [[APIClient shared] putPath:urlString parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Save User to Server Succeeded");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Save User to Server Failed: %@", error);
    }];
}

@end
