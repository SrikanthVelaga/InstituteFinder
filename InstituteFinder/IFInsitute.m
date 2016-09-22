//
//  IFInsitute.m
//  InstituteFinder
//
//  Created by Asquare Mobile Technologies on 9/21/16.
//  Copyright © 2016 Asquare Mobile Technologies. All rights reserved.
//

#import "IFInsitute.h"

@implementation IFInsitute

// Insert code here to add functionality to your managed object subclass

+ (void)insertInstituteWithInstituteData:(NSArray *)instituteData context:(NSManagedObjectContext *)defaultManagedObjectContext withCompletionHandler:(void(^)(IFInsitute *institute))completion
{
    [instituteData enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        IFInsitute *clientsEntity = [NSEntityDescription
                                          insertNewObjectForEntityForName:@"IFInsitute"
                                          inManagedObjectContext:defaultManagedObjectContext];
        
        [clientsEntity setValue:[obj valueForKey:@"name"] forKey:@"name"];
        [clientsEntity setValue:[obj valueForKey:@"email"] forKey:@"email"];

        [clientsEntity setValue:[obj valueForKey:@"phone number"] forKey:@"phoneNumber"];

        [clientsEntity setValue:[obj valueForKey:@"courses"] forKey:@"courses"];

        [clientsEntity setValue:[obj valueForKey:@"address"] forKey:@"address"];
        [clientsEntity setValue:[obj valueForKey:@"url"] forKey:@"imageurl"];
        
        NSError *error = nil;
        
        if ([defaultManagedObjectContext save:&error]) {
            completion(clientsEntity);
        }else {
            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        }
        
        
    }];
    
    
}


@end
