//
//  InstituteViewController.m
//  InstituteFinder
//
//  Created by Madu Venkata Dinesh Goud on 07/09/16.
//  Copyright © 2016 Asquare Mobile Technologies. All rights reserved.
//

#import "InstituteViewController.h"
#import "Institute.h"

@interface InstituteViewController ()
@property(nonatomic,strong)NSArray *institutesArray;
@property(nonatomic,strong)NSMutableArray *institutesObjectsArray;


@end

@implementation InstituteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeObjects];
    [self getInstitutesInfo];
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
    self.institutesArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSLog(@"json institutes%@",self.institutesArray);
    
    for (int i = 0; i < _institutesArray.count; i++) {
        
        NSDictionary *instituteDic = self.institutesArray[i];
        
        Institute *institute = [[Institute alloc] init];
        institute.address = instituteDic[@"address"];
        institute.courses = instituteDic[@"courses"];
        institute.email = instituteDic[@"email"];
        institute.name = instituteDic[@"name"];
        institute.phoneNumber = instituteDic[@"phone number"];
        [self.institutesObjectsArray addObject:institute];
    }
    
    Institute *institute = self.institutesObjectsArray[0];
    
    NSLog(@"Institues details: name: %@ , \n email: %@", institute.name, institute.email);
    
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
