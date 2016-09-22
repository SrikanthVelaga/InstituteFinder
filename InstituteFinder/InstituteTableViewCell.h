//
//  InstituteTableViewCell.h
//  InstituteFinder
//
//  Created by harinath on 13/09/16.
//  Copyright © 2016 Asquare Mobile Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Institute.h"
#import "InstituteViewController.h"
#import "IFInsitute.h"

@interface InstituteTableViewCell : UITableViewCell

@property (assign, nonatomic) id <InstituteViewControllerProtocol> instituteViewDelegate;

@property (strong, nonatomic) Institute *institute;
@property (strong, nonatomic) IFInsitute *iFInsitute;

- (void)updateCellAtIndexPath:(NSIndexPath *)indexPath;

@end
