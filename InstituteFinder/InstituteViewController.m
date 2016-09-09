//
//  InstituteViewController.m
//  InstituteFinder
//
//  Created by Madu Venkata Dinesh Goud on 07/09/16.
//  Copyright © 2016 Asquare Mobile Technologies. All rights reserved.
//

#import "InstituteViewController.h"
#import "Singleton.h"

@interface InstituteViewController ()
@property(nonatomic,strong)NSArray *jsonInstituteArr;
@property(nonatomic)Singleton *SingletonObj;


@end

@implementation InstituteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeObjects];
    [self getInstitutesInfo];
    _SingletonObj=[Singleton SharedClass];
    // Do any additional setup after loading the view.
}

#pragma mark - Private API
- (void)initializeObjects {
    self.institutesObjectsArray = [[NSMutableArray alloc] initWithCapacity:0];
}

-(void)getInstitutesInfo{
    NSError *error = nil;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"institutesnames"ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    self.jsonInstituteArr = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSLog(@"json institutes%@",self.jsonInstituteArr);
    [self.SingletonObj.InstituteArr addObject:self.jsonInstituteArr];
    NSLog(@"json institutes%@",self.SingletonObj.InstituteArr);
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
