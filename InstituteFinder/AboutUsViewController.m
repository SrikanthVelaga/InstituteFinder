//
//  AboutUsViewController.m
//  InstituteFinder
//
//  Created by Madu Venkata Dinesh Goud on 07/09/16.
//  Copyright © 2016 Asquare Mobile Technologies. All rights reserved.
//

#import "AboutUsViewController.h"
#import "MFSideMenu.h"

@interface AboutUsViewController ()
@property (strong, nonatomic) IBOutlet UILabel *AboutUsLabel;
@property(nonatomic,strong)NSString *aboutusstr;
@end

@implementation AboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self aboutusInfo];
    self.AboutUsLabel.text=self.aboutusstr;
    // Do any additional setup after loading the view.
}
#pragma mark - IBAction Methods
- (IBAction)left:(UIBarButtonItem *)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}
#pragma mark custom methods

-(void)aboutusInfo{
    
    _aboutusstr=@"This app is about giving you a quick glimpse of what's happening in hyderabad";
    NSLog(@"aboutusinfo%@", _aboutusstr);
    
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
