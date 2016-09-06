//
//  leftViewController.m
//  InstituteFinder
//
//  Created by Madu Venkata Dinesh Goud on 02/09/16.
//  Copyright © 2016 Asquare Mobile Technologies. All rights reserved.
//

#import "leftViewController.h"
#import "MFSideMenu.h"
#import "ViewController.h"

@interface leftViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UILabel *usernamelabel;
@property (strong, nonatomic) IBOutlet UITableView *Tableview;
@property(strong, nonatomic) NSMutableArray *mutArr;
@property(strong, nonatomic) NSArray *jsonArr;
@property(strong, nonatomic) NSString *aboutusstr;
@property(strong, nonatomic) NSDictionary *contactusdic;
@end

@implementation leftViewController
#pragma mark - View LifeCycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mutArr=[[NSMutableArray alloc]initWithObjects:@"Course", @"About Us", @"Contact Us", nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark custom methods

-(void)getCoursesInfo{
    NSError *error = nil;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"coursenames"ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSArray *jsonArr=[[NSArray alloc]init];
    jsonArr = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    NSLog(@"json %@",jsonArr);
    if (error != nil) {
        NSLog(@"Error: was not able to load messages.");
        
    }
    [self performSegueWithIdentifier:@"viewcontroller" sender:jsonArr];
}
-(void)aboutusInfo{
    NSString *aboutusstr=[[NSString alloc]init];
    aboutusstr=@"This app is about giving you a quick glimpse of what's happening in hyderabad";
    [self performSegueWithIdentifier:@"viewcontroller" sender:aboutusstr];
    NSLog(@"aboutusinfo%@", aboutusstr);
    
}
-(void)contactusInfo{
    NSDictionary *contactusdic=[[NSDictionary alloc]initWithObjectsAndKeys:@"dinesh",@"name",@"9705873797",@"phone number",@"mvfeast1@gmail.com", @"email", nil];
    [self performSegueWithIdentifier:@"viewcontroller" sender:contactusdic];
    NSLog(@"contactusinfo %@", contactusdic);
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (sender==self.jsonArr) {
        ViewController *viewcontroller=[segue destinationViewController];
        viewcontroller.courseArr=sender;
        
    }else if (sender==self.aboutusstr) {
        ViewController *viewcontroller=[segue destinationViewController];
        viewcontroller.aboutusstr=sender;
    }else if (sender==self.contactusdic){
        ViewController *viewcontroller=[segue destinationViewController];
        viewcontroller.comingcontactusdic=sender;
    }
    
}



#pragma mark delegate Methods
#pragma mark tableview delegate Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.mutArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *myid=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:myid];
    if (cell==nil) {
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myid];
    }
    cell.textLabel.text=[self.mutArr objectAtIndex:indexPath.row];
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        [self getCoursesInfo];
    }else if (indexPath.row==1) {
        [self aboutusInfo];
    }else {
        [self contactusInfo];
    }

    }
    @end
