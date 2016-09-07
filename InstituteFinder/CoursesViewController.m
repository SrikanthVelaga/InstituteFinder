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

@property (strong, nonatomic) IBOutlet UITableView *TableView;
@property(nonatomic,strong)NSArray *jsonArr;
@end

@implementation CoursesViewController
#pragma mark - View LifeCycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getCoursesInfo];
    self.TableView.backgroundColor=[UIColor orangeColor];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark custom methods
-(void)getCoursesInfo{
    NSError *error = nil;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"coursenames"ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
   
    self.jsonArr = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    NSLog(@"json %@",self.jsonArr);
    if (error != nil) {
        NSLog(@"Error: was not able to load messages.");
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - IBAction Methods
- (IBAction)left:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
    
}
#pragma mark delegate Methods
#pragma mark tableview delegate Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.jsonArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell==nil) {
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.textLabel.text=[self.jsonArr objectAtIndex:indexPath.row];
    cell.backgroundColor=[UIColor orangeColor];
    return cell;
    
}

@end
