//
//  InstituteViewController.m
//  InstituteFinder
//
//  Created by Madu Venkata Dinesh Goud on 07/09/16.
//  Copyright © 2016 Asquare Mobile Technologies. All rights reserved.
//

#import "InstituteViewController.h"
#import "InstituteDetailViewController.h"

@interface InstituteViewController ()
@property(nonatomic,strong)NSArray *jsonInstitutesArr;
@property (weak, nonatomic) IBOutlet UITableView *TableView;


@end

@implementation InstituteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getInstitutesInfo];
    
    
    
    
    // Do any additional setup after loading the view.
}

#pragma mark - Private API

-(void)getInstitutesInfo{
    NSLog(@"selected course %@",self.seletedcoursestr);
    NSError *error = nil;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"institutesnames"ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    self.jsonInstitutesArr = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSLog(@"json institutes%@",self.jsonInstitutesArr);
    
     self.jsonInstitutesArr = [self.jsonInstitutesArr filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(ANY courses LIKE[cd] %@)", self.seletedcoursestr]];
    
    [self.TableView reloadData];
    
    if (error != nil) {
        NSLog(@"Error: was not able to load messages.");
        
    }
}
#pragma mark tableview delegate Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
        return self.jsonInstitutesArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell==nil) {
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
        cell.textLabel.text=[[self.jsonInstitutesArr objectAtIndex:indexPath.row ]valueForKey:@"name"];
    cell.detailTextLabel.text=[[self.jsonInstitutesArr objectAtIndex:indexPath.row ]valueForKey:@"phone number"];
    cell.backgroundColor=[UIColor orangeColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"InstituteDetail" sender:[self.jsonInstitutesArr objectAtIndex:indexPath.row]];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    InstituteDetailViewController *Institute=[segue destinationViewController];
    Institute.InstituteDetailArr=sender;
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
