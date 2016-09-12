//
//  LoginViewController.m
//  InstituteFinder
//
//  Created by Madu Venkata Dinesh Goud on 03/09/16.
//  Copyright © 2016 Asquare Mobile Technologies. All rights reserved.
//

#import "LoginViewController.h"
#import "ACFloatingTextField.h"
#import "CoursesViewController.h"
#import "MFSideMenu.h"

@interface LoginViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet ACFloatingTextField *usernamefield;
@property(nonatomic,strong)NSString *str;

@end

@implementation LoginViewController

#pragma mark - View LifeCycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - IBAction Methods

- (IBAction)Login:(id)sender {
    self.usernamefield.text=self.str;
    MFSideMenuContainerViewController *container = (MFSideMenuContainerViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"MFSideMenuContainerViewController"];
    UINavigationController *navigationcontroller=[self.storyboard instantiateViewControllerWithIdentifier:@"navigationcontroller"];
    UIViewController *leftSideMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"leftViewController"];
    [container setLeftMenuViewController:leftSideMenuViewController];
    [container setCenterViewController:navigationcontroller];
    
    [self.navigationController pushViewController:container animated:YES];
    
}

#pragma mark Delegate Methods

#pragma mark  UITextfield Delegates

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    
    [(ACFloatingTextField *)textField textFieldDidBeginEditing];
}
-(void)textFieldDidEndEditing:(UITextField *)textField {
    [(ACFloatingTextField *)textField textFieldDidEndEditing];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;   // return NO to not change text
{
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    return YES;
}




@end
