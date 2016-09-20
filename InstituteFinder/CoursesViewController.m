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
#import "InstituteViewController.h"
#import "CoursesTableViewCell.h"
#import "IFHttpClient.h"

@interface CoursesViewController (){
    
}
@property (weak, nonatomic) IBOutlet UISearchBar *SearchBar;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *coursesArr;
@property(nonatomic,strong)NSMutableArray *filteredArr;
@end

@implementation CoursesViewController
#pragma mark - View LifeCycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    [self InitializedObjects];
    [self PrepareView];
    
}
- (void)InitializedObjects
{
  _coursesArr=[[NSMutableArray alloc]init];
    _filteredArr = [[NSMutableArray alloc] init];

}
-(void)PrepareView
{
    
    [[IFHttpClient sharedHttpClient] getCoursesWithParameters:nil success:^(NSArray *result) {
        if ([result isKindOfClass:[NSArray class]]) {
            [self.coursesArr addObjectsFromArray:result];
             NSLog(@"JSON %@",self.coursesArr);
             [self.tableView reloadData];
        }
       } failure:^(NSError *error) {
        
    }];
     [self.tableView registerNib:[UINib nibWithNibName:@"CoursesTableViewCell" bundle:nil] forCellReuseIdentifier:@"CoursesCell"];

}
#pragma mark custom methods
    - (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - IBAction Methods
- (IBAction)left:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
    
}
#pragma mark delegate Methods
#pragma mark SearchBar delegate Methods
-(void)searchBarDidSelect:(UISearchBar*)SearchBar
{
    [self.tableView resignFirstResponder];
}

-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)text
{
    if(text.length == 0)
    {
        isFiltered = NO;
    }
    else
    {
        isFiltered =YES;
        
        for (NSString* str in _coursesArr)
        {
            NSRange nameRange = [str rangeOfString:text options:NSCaseInsensitiveSearch];
            
            if(nameRange.location != NSNotFound)
            {
                [_filteredArr addObject:str];
            }
        }
    }
    
    [self.tableView reloadData];
}

#pragma mark tableview delegate Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (isFiltered) {
        return self.filteredArr.count;
    }
    else
    return self.coursesArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CoursesTableViewCell *coursesTableViewCell=(CoursesTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"CoursesCell" forIndexPath:indexPath];
    if (isFiltered){
        
        coursesTableViewCell.nameLbl.text=[self.filteredArr objectAtIndex:indexPath.row];
        
        
    
    }else
    {
        coursesTableViewCell.nameLbl.text=[self.coursesArr objectAtIndex:indexPath.row];

           }
    return coursesTableViewCell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *str=[_coursesArr objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"institutes" sender:str];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    InstituteViewController *instituteViewController=[segue destinationViewController];
    instituteViewController.seletedcoursestr=sender;
}
@end
