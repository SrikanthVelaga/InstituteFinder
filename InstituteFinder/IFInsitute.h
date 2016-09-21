//
//  IFInsitute.h
//  InstituteFinder
//
//  Created by Asquare Mobile Technologies on 9/21/16.
//  Copyright © 2016 Asquare Mobile Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface IFInsitute : NSManagedObject

// Insert code here to declare functionality of your managed object subclass

+ (void)insertInstituteWithInstituteData:(NSArray *)instituteData context:(NSManagedObjectContext *)defaultManagedObjectContext withCompletionHandler:(void(^)(IFInsitute *institute))completion;



@end

NS_ASSUME_NONNULL_END

#import "IFInsitute+CoreDataProperties.h"
