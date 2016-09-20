//
//  Institute.h
//  InstituteFinder
//
//  Created by Asquare Mobile Technologies on 9/8/16.
//  Copyright © 2016 Asquare Mobile Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Institute : NSObject

@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSArray *courses;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *phoneNumber;
@property (strong, nonatomic) NSString *imageurl;

@end
