//
//  APIClient.h
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"

@interface APIClient : AFHTTPClient <NSURLConnectionDelegate>

+(APIClient *) shared;

-(void)setAuthenticationToken:(NSString *)token;
-(NSDictionary *) headers;
-(void)getMe:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
-(void)createSessionWithFBAccessToken:(NSString*)token success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;
-(void)destroySession:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

// users
-(void)saveUserToServer;

@end
