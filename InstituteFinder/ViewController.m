//
//  ViewController.m
//  InstituteFinder
//
//  Created by Asquare Mobile Technologies on 8/25/16.
//  Copyright © 2016 Asquare Mobile Technologies. All rights reserved.
//

#import "ViewController.h"
#import "MFSideMenu.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=self.str1;
    [self getCoursesInfo];
    // Do any additional setup after loading the view, typically from a nib.
    

}
- (IBAction)left:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getCoursesInfo{
    NSError *error = nil;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"coursenames"ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSArray *json=[[NSArray alloc]init];
    json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSLog(@"json %@",json);
    if (error != nil) {
        NSLog(@"Error: was not able to load messages.");
        
    }
}

@end
