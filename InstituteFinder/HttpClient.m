//
//  HttpClient.m
//  Sessions
//
//  Created by Mac on 22/07/16.
//  Copyright © 2016 ASquare. All rights reserved.
//

#import "HttpClient.h"

@implementation HttpClient
-(void)getServiceCall:(NSString*)urlStr andCompletion:(void(^)(id json,NSError*error))competionHandler{
    
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            competionHandler(nil,error);
            return ;
        }
        NSError *err = nil;
        id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
        if (err) {
            competionHandler(nil,error);
            return ;
        }
        competionHandler(json,nil);
        
    }];
    [dataTask resume];
}

@end
