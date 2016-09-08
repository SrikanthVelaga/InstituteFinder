//
//  leftViewController.m
//  InstituteFinder
//
//  Created by Madu Venkata Dinesh Goud on 02/09/16.
//  Copyright © 2016 Asquare Mobile Technologies. All rights reserved.
//

#import "leftViewController.h"
#import "MFSideMenu.h"
#import "CoursesViewController.h"

@interface leftViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UILabel *usernamelabel;
@property (strong, nonatomic) IBOutlet UITableView *Tableview;
@property(strong, nonatomic) NSMutableArray *mutArr;
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
    
    UINavigationController *navigationcontroller;
    if (indexPath.row==0) {
       navigationcontroller =[self.storyboard instantiateViewControllerWithIdentifier:@"navigationcontroller"];
        
        
    }else if (indexPath.row==1) {

        navigationcontroller =[self.storyboard instantiateViewControllerWithIdentifier:@"AboutUsNavigationController"];

    
    }else {
       navigationcontroller =[self.storyboard instantiateViewControllerWithIdentifier:@"ContactUsNavigationController"];
    }

    self.menuContainerViewController.centerViewController = navigationcontroller;
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
    
}
@end
