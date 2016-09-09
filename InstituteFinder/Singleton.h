//
//  Singleton.h
//  InstituteFinder
//
//  Created by Madu Venkata Dinesh Goud on 09/09/16.
//  Copyright © 2016 Asquare Mobile Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject
@property(nonatomic,strong)NSMutableArray *InstituteArr;
+(id)SharedClass;
@end
