//
//  InstituteViewController.h
//  InstituteFinder
//
//  Created by Madu Venkata Dinesh Goud on 07/09/16.
//  Copyright © 2016 Asquare Mobile Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  Institute;

@protocol InstituteViewControllerProtocol <NSObject>

@optional
- (void)goToInstituteDetailViewWithInstitute:(Institute *)institute;

@end

@interface InstituteViewController : UIViewController
@property(nonatomic,strong)NSString *seletedcoursestr;
@end
