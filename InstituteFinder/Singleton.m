//
//  Singleton.m
//  InstituteFinder
//
//  Created by Madu Venkata Dinesh Goud on 09/09/16.
//  Copyright © 2016 Asquare Mobile Technologies. All rights reserved.
//

#import "Singleton.h"
static Singleton *SharedInstane=nil;
@implementation Singleton
+(id)SharedClass
{
    if (SharedInstane==nil) {
        SharedInstane=[[Singleton alloc]init];
    }
    return SharedInstane;
}
-(id)init
{
    _InstituteArr=[[NSMutableArray alloc]init];
    return self;
}
@end
