//
//  ViewController.m
//  InstituteFinder
//
//  Created by Asquare Mobile Technologies on 8/25/16.
//  Copyright © 2016 Asquare Mobile Technologies. All rights reserved.
//

#import "CoursesViewController.h"
#import "MFSideMenu.h"
#import "leftViewController.h"

@interface CoursesViewController ()


@end

@implementation CoursesViewController
#pragma mark - View LifeCycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    self.courseArr=[[NSArray alloc]init];
    NSLog(@"jsonArr coming is %@", self.courseArr);
    NSLog(@"aboutusinfo coming is %@", self.aboutusstr);
    NSLog(@"contactusinfo coming is %@", self.comingcontactusdic);

    // Do any additional setup after loading the view, typically from a nib.
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - IBAction Methods
- (IBAction)left:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
    
}


@end
