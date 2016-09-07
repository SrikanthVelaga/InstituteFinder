//
//  InstituteViewController.m
//  InstituteFinder
//
//  Created by Madu Venkata Dinesh Goud on 07/09/16.
//  Copyright © 2016 Asquare Mobile Technologies. All rights reserved.
//

#import "InstituteViewController.h"

@interface InstituteViewController ()
@property(nonatomic,strong)NSArray *jsonInstituteArr;


@end

@implementation InstituteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getInstitutesInfo];
    // Do any additional setup after loading the view.
}
#pragma mark custom methods
-(void)getInstitutesInfo{
    NSError *error = nil;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"institutesnames"ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    self.jsonInstituteArr = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSLog(@"json institutes%@",self.jsonInstituteArr);
    if (error != nil) {
        NSLog(@"Error: was not able to load messages.");
        
    }
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
