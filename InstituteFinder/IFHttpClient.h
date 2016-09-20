//
//  IFHttpClient.h
//  InstituteFinder
//
//  Created by Asquare Mobile Technologies on 9/13/16.
//  Copyright © 2016 Asquare Mobile Technologies. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface IFHttpClient : AFHTTPSessionManager

+ (IFHttpClient *)sharedHttpClient;

- (void)getCoursesWithParameters:(NSDictionary *)parameters success:(void (^)(NSArray *result))success failure:(void (^)(NSError *error))failure;
- (void)getInstitutesWithParameters:(NSDictionary *)parameters success:(void (^)(NSArray *result))success failure:(void (^)(NSError *error))failure;

@end
