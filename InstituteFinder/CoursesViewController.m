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
{
    BOOL isFiltered;
}
@property (strong, nonatomic) IBOutlet UISearchBar *SearchBar;

@property (strong, nonatomic) IBOutlet UITableView *TableView;
@property(nonatomic,strong)NSMutableArray *jsonArr;
@property(nonatomic,strong)NSMutableArray *FilteredData;

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
    
    if(isFiltered){
        return[_FilteredData count];
    }
    else
       return[self.jsonArr count];
    
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell==nil) {
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    if(isFiltered)
    {
        cell.textLabel.text=[self.FilteredData objectAtIndex:indexPath.row];
    }
    cell.textLabel.text=[self.jsonArr objectAtIndex:indexPath.row];
    cell.backgroundColor=[UIColor orangeColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"institutes" sender:self];
}
#pragma mark SearchBar delegate Methods
-(void)searchBarSearchButtonClicked:(UISearchBar *)SearchBar
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
        isFiltered = YES;
        _FilteredData = [[NSMutableArray alloc] init];
        
        for (NSString* str in _jsonArr)
        {
            NSRange Range = [str rangeOfString:text options:NSCaseInsensitiveSearch];
            
                       if(Range.location != NSNotFound)
            {
                [_FilteredData addObject:str];
            }
        }
    }
    
    [self.TableView reloadData];
}

@end
