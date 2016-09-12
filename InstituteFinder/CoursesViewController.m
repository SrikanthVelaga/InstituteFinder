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
#import "HttpClient.h"

@interface CoursesViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *SearchBar;

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *jsonArr;
@property(nonatomic,strong)NSMutableArray *filteredArr;
@end

@implementation CoursesViewController
#pragma mark - View LifeCycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    [self PrepareView];
//    [self.tableView reloadData];

    
}

-(void)PrepareView
    {
    HttpClient *client = [[HttpClient alloc]init];
    NSString *urlStr = @"http://harinaths-mac-mini.local:8000/coursenames.json";
    [client getServiceCall:urlStr andCompletion:^(id json, NSError *error) {
        if (error) {
            NSLog(@"%@",[error localizedDescription]);
        }
        if ([json isKindOfClass:[NSArray class]]) {
            self.jsonArr=[[NSMutableArray alloc]init];
            [self.jsonArr addObjectsFromArray:json];
            
        }
        NSLog(@"JSON %@",self.jsonArr);
        [self.tableView reloadData];

           }];


    //self.tableView.backgroundColor=[UIColor orangeColor];
    // Do any additional setup after loading the view, typically from a nib.
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
        _filteredArr = [[NSMutableArray alloc] init];
        
        for (NSString* str in _jsonArr)
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
    return self.jsonArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell==nil) {
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    if (isFiltered) {
        cell.textLabel.text=[self.filteredArr objectAtIndex:indexPath.row];
        cell.backgroundColor=[UIColor orangeColor];
    }else {
        cell.textLabel.text=[self.jsonArr objectAtIndex:indexPath.row];
        cell.backgroundColor=[UIColor orangeColor];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *str=[self.jsonArr objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"institutes" sender:str];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    InstituteViewController *instituteViewController=[segue destinationViewController];
    instituteViewController.seletedcoursestr=sender;
}
@end
