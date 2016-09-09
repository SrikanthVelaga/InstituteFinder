//
//  ContactUsViewController.m
//  InstituteFinder
//
//  Created by Madu Venkata Dinesh Goud on 07/09/16.
//  Copyright © 2016 Asquare Mobile Technologies. All rights reserved.
//

#import "ContactUsViewController.h"
#import "MFSideMenu.h"

@interface ContactUsViewController ()
@property(strong,nonatomic)NSDictionary *contactusdic;
@property (strong, nonatomic) IBOutlet UITextField *nametextfield;
@property (strong, nonatomic) IBOutlet UITextField *phonenotextfield;
@property (strong, nonatomic) IBOutlet UITextField *emailtextfield;

@end

@implementation ContactUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self contactusInfo];
    self.nametextfield.text=[self.contactusdic valueForKey:@"name"];
    self.phonenotextfield.text=[self.contactusdic valueForKey:@"phone number"];
    self.emailtextfield.text=[self.contactusdic valueForKey:@"email"];
    // Do any additional setup after loading the view.
}
#pragma mark custom methods
-(void)contactusInfo{
    self.contactusdic=[NSDictionary dictionaryWithObjectsAndKeys:@"dinesh",@"name",@"9705873797",@"phone number",@"mvfeast1@gmail.com", @"email", nil];
    NSLog(@"contactusinfo %@", self.contactusdic);
    
}


#pragma mark - IBAction Methods
- (IBAction)left:(UIBarButtonItem *)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
