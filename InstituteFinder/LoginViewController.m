//
//  LoginViewController.m
//  InstituteFinder
//
//  Created by Madu Venkata Dinesh Goud on 03/09/16.
//  Copyright © 2016 Asquare Mobile Technologies. All rights reserved.
//

#import "LoginViewController.h"
#import "ACFloatingTextField.h"
#import "ViewController.h"
#import "MFSideMenu.h"

@interface LoginViewController () <UITextFieldDelegate>

@property(nonatomic,strong)ACFloatingTextField *fld;
@property(nonatomic,strong)NSString *str;
- (IBAction)Login:(id)sender;

@end

@implementation LoginViewController

#pragma mark - View LifeCycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Private API

- (void)prepareView {
    self.fld =[[ACFloatingTextField alloc]initWithFrame:CGRectMake(10, 100, 150, 34)];
    
    _fld.delegate = self;
    [_fld setTextFieldPlaceholderText:@"userName"];
    [self.view addSubview:_fld];
    
    
    UIImageView *imag=[[UIImageView alloc]initWithFrame:CGRectMake(160, 100, 15, 15)];
    imag.image=[UIImage imageNamed:@"image.png"];
    [self.view addSubview:imag];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - IBAction Methods

- (IBAction)Login:(id)sender {
    
    _str=_fld.text;
    
    MFSideMenuContainerViewController *container = (MFSideMenuContainerViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"MFSideMenuContainerViewController"];
    // MFSideMenuContainerViewController *container=(MFSideMenuContainerViewController *)self.window.rootViewController;
    UINavigationController *navigationcontroller=[self.storyboard instantiateViewControllerWithIdentifier:@"navigationcontroller"];
    UIViewController *leftSideMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"leftViewController"];
    //   UIViewController *rightSideMenuViewController = [story instantiateViewControllerWithIdentifier:@"rightViewController"];
    //   [container setRightMenuViewController:rightSideMenuViewController];
    [container setLeftMenuViewController:leftSideMenuViewController];
    [container setCenterViewController:navigationcontroller];
    
    [self.navigationController pushViewController:container animated:YES];
    
   // [self performSegueWithIdentifier:@"login" sender:nil];
}
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    ViewController *next=[segue destinationViewController];
//    next.str1=_str;
//    
//}
@end
