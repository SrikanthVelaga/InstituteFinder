//
//  IFInsitute+CoreDataProperties.h
//  InstituteFinder
//
//  Created by Asquare Mobile Technologies on 9/21/16.
//  Copyright © 2016 Asquare Mobile Technologies. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "IFInsitute.h"

NS_ASSUME_NONNULL_BEGIN

@interface IFInsitute (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *address;
@property (nullable, nonatomic, retain) id courses;
@property (nullable, nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *phoneNumber;
@property (nullable, nonatomic, retain) NSString *imageurl;

@end

NS_ASSUME_NONNULL_END
