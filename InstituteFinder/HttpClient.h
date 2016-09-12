//
//  HttpClient.h
//  Sessions
//
//  Created by Mac on 22/07/16.
//  Copyright © 2016 ASquare. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpClient : NSObject
-(void)getServiceCall:(NSString*)urlStr andCompletion:(void(^)(id json,NSError*error))competionHandler;
-(void)postServiceCall:(NSString*)urlStr andParams:(NSDictionary*)params andCompletion:(void(^)(id json,NSError*error))competionHandler;

@end
