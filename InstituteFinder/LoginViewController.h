//
//  LoginViewController.h
//  InstituteFinder
//
//  Created by Madu Venkata Dinesh Goud on 03/09/16.
//  Copyright © 2016 Asquare Mobile Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ACFloatingTextField.h"
@interface LoginViewController : UIViewController<UITextFieldDelegate>
@property(nonatomic,strong)ACFloatingTextField *fld;
@property(nonatomic,strong)NSString *str;
- (IBAction)Login:(id)sender;

@end
