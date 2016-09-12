//
//  InstituteViewController.m
//  InstituteFinder
//
//  Created by Madu Venkata Dinesh Goud on 07/09/16.
//  Copyright © 2016 Asquare Mobile Technologies. All rights reserved.
//

#import "InstituteViewController.h"
#import "InstituteDetailViewController.h"
#import "Institute.h"

@interface InstituteViewController ()
@property(nonatomic,strong)NSArray *jsonInstitutesArr;
@property (weak, nonatomic) IBOutlet UITableView *TableView;
@property(strong,nonatomic)NSMutableArray *InstitutesArr;


@end

@implementation InstituteViewController

#pragma mark - View LifeCycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    self.InstitutesArr=[[NSMutableArray alloc]init];
    [self getInstitutesInfo];
    self.TableView.backgroundColor=[UIColor orangeColor];
    // Do any additional setup after loading the view.
}

#pragma mark - Private API

-(void)getInstitutesInfo{
    NSError *error;
    NSString *urlString = [NSString stringWithFormat: @"http://madus-macbook-pro.local:8000/institutesnames.json"];
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:urlString]];
    self.jsonInstitutesArr = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSLog(@"jsonInstituteArr: %@",self.jsonInstitutesArr);
    
     self.jsonInstitutesArr = [self.jsonInstitutesArr filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(ANY courses LIKE[cd] %@)", self.seletedcoursestr]];
    
    for (int i=0; i<self.jsonInstitutesArr.count; i++) {
        Institute *institute=[[Institute alloc]init];
        institute.name=[[self.jsonInstitutesArr objectAtIndex:i]valueForKey:@"name"];
        institute.courses=[[self.jsonInstitutesArr objectAtIndex:i]valueForKey:@"courses"];
        institute.email=[[self.jsonInstitutesArr objectAtIndex:i]valueForKey:@"email"];
        institute.address=[[self.jsonInstitutesArr objectAtIndex:i]valueForKey:@"address"];
        institute.phoneNumber=[[self.jsonInstitutesArr objectAtIndex:i]valueForKey:@"phone number"];
        [self.InstitutesArr addObject:institute];
        NSLog(@"InstituteArr %@",self.InstitutesArr);
    }
    [self.TableView reloadData];
    if (error != nil) {
        NSLog(@"Error: was not able to load messages.");
       
        
    }
}
#pragma mark Delegate Methods

#pragma mark tableview delegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
        return self.InstitutesArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell==nil) {
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    Institute *InstituteObject=(Institute *)[self.InstitutesArr objectAtIndex:indexPath.row];
    cell.textLabel.text=InstituteObject.name;
    cell.detailTextLabel.text=InstituteObject.phoneNumber;
    cell.backgroundColor=[UIColor orangeColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"InstituteDetail" sender:[self.InstitutesArr objectAtIndex:indexPath.row]];
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
