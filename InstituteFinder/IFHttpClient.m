//
//  IFHttpClient.m
//  InstituteFinder
//
//  Created by Asquare Mobile Technologies on 9/13/16.
//  Copyright © 2016 Asquare Mobile Technologies. All rights reserved.
//

#import "IFHttpClient.h"

static NSString *const kBaseUrl = @"http://asquares-mac-mini-2.local:8000/";

@implementation IFHttpClient

+ (IFHttpClient *)sharedHttpClient {
    
    static IFHttpClient *sharedHttpClient = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedHttpClient = [[IFHttpClient alloc] initWithBaseURL:[NSURL URLWithString:kBaseUrl]];
    });
    
    return sharedHttpClient;
}

- (void)getCoursesWithParameters:(NSDictionary *)parameters success:(void (^)(NSArray *result))success failure:(void (^)(NSError *error))failure {
    
    [self GET:@"coursenames.json" parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}


@end
