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
@property (strong, nonatomic) IBOutlet UILabel *namelabel;
@property (strong, nonatomic) IBOutlet UILabel *emaillabel;
@property (strong, nonatomic) IBOutlet UILabel *phonenumberlabel;


@end

@implementation ContactUsViewController

#pragma mark - View LifeCycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    [self contactusInfo];
    self.namelabel.text=[self.contactusdic valueForKey:@"name"];
    self.phonenumberlabel.text=[self.contactusdic valueForKey:@"phone number"];
    self.emaillabel.text=[self.contactusdic valueForKey:@"email"];
    // Do any additional setup after loading the view.
}
#pragma mark Custom Methods

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
