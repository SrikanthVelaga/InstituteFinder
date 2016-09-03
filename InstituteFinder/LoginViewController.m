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
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fld =[[ACFloatingTextField alloc]initWithFrame:CGRectMake(10, 100, 150, 34)];
    
    _fld.delegate = self;
    [_fld setTextFieldPlaceholderText:@"userName"];
    [self.view addSubview:_fld];
    
    
    UIImageView *imag=[[UIImageView alloc]initWithFrame:CGRectMake(160, 100, 15, 15)];
    imag.image=[UIImage imageNamed:@"image.png"];
    [self.view addSubview:imag];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark  UITextfield Delegates
-(void)textFieldDidBeginEditing:(UITextField *)textField {
    
    [(ACFloatingTextField *)textField textFieldDidBeginEditing];
}
-(void)textFieldDidEndEditing:(UITextField *)textField {
    [(ACFloatingTextField *)textField textFieldDidEndEditing];
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

- (IBAction)Login:(id)sender {
    _str=_fld.text;
    [self performSegueWithIdentifier:@"login" sender:nil];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ViewController *next=[segue destinationViewController];
    next.str1=_str;
    
}
@end
