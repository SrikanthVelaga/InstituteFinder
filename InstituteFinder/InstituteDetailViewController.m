//
//  InstituteDetailViewController.m
//  InstituteFinder
//
//  Created by Madu Venkata Dinesh Goud on 07/09/16.
//  Copyright © 2016 Asquare Mobile Technologies. All rights reserved.
//

#import "InstituteDetailViewController.h"
#import "Institute.h"

@interface InstituteDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *NameLbl;
@property (weak, nonatomic) IBOutlet UILabel *PhoneLbl;
@property (weak, nonatomic) IBOutlet UILabel *EmailLbl;
@property (weak, nonatomic) IBOutlet UILabel *CoursesLbl;
@property (weak, nonatomic) IBOutlet UILabel *AddressLbl;


@end

@implementation InstituteDetailViewController

#pragma mark - View LifeCycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"DeatilArr %@",self.InstituteDetailArr);
    [self PrepareView];
    // Do any additional setup after loading the view.
}
#pragma mark Custom Methods

-(void)PrepareView
{
    self.NameLbl.text=self.InstituteDetailArr.name;
    self.PhoneLbl.text=self.InstituteDetailArr.phoneNumber;
    self.EmailLbl.text=self.InstituteDetailArr.email;
    self.CoursesLbl.text = [NSString stringWithFormat:@"%@",self.InstituteDetailArr.courses];
    self.AddressLbl.text=self.InstituteDetailArr.address;
    
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
