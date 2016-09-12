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

@interface CoursesViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *SearchBar;
@property (strong,nonatomic)NSMutableArray *json;
@property(nonatomic,strong)NSMutableArray *filteredArr;

@property (strong, nonatomic) IBOutlet UITableView *TableView;
@end

@implementation CoursesViewController
#pragma mark - View LifeCycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getCoursesInfo];
    self.TableView.backgroundColor=[UIColor orangeColor];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark - Private API

-(void)getCoursesInfo{
    NSError *error;
NSString *urlString = [NSString stringWithFormat: @"http://madus-macbook-pro.local:8000/coursenames.json"];
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:urlString]];
    self.json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSLog(@"json: %@",self.json);
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

#pragma mark SearchBar delegate Methods
-(void)searchBarDidSelect:(UISearchBar*)SearchBar
{
    [self.TableView resignFirstResponder];
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
        self.filteredArr = [[NSMutableArray alloc] init];
        
        for (NSString* str in self.json)
        {
            NSRange nameRange = [str rangeOfString:text options:NSCaseInsensitiveSearch];
            
            if(nameRange.location != NSNotFound)
            {
                [self.filteredArr addObject:str];
            }
        }
    }
    
    [self.TableView reloadData];
}

#pragma mark tableview delegate Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (isFiltered) {
        return self.filteredArr.count;
    }
    else
        return self.json.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell==nil) {
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }if (isFiltered) {
        cell.textLabel.text=[self.filteredArr objectAtIndex:indexPath.row];
        cell.backgroundColor=[UIColor orangeColor];
    }else {
    
        cell.textLabel.text=[self.json objectAtIndex:indexPath.row];
        cell.backgroundColor=[UIColor orangeColor];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   NSString *str=[self.json objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"institutes" sender:str];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    InstituteViewController *instituteViewController=[segue destinationViewController];
    instituteViewController.seletedcoursestr=sender;
}
@end
