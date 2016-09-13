//
//  InstituteViewController.m
//  InstituteFinder
//
//  Created by Madu Venkata Dinesh Goud on 07/09/16.
//  Copyright © 2016 Asquare Mobile Technologies. All rights reserved.
//

#import "InstituteViewController.h"
#import "InstituteDetailViewController.h"
#import "HttpClient.h"
#import "Institute.h"
#import "InstituteTableViewCell.h"

@interface InstituteViewController () <InstituteViewControllerProtocol>

@property(nonatomic,strong)NSMutableArray *jsonInstitutesArr;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *InstitutesArr;


@end

@implementation InstituteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self PrepareView];
}

- (void)PrepareView{
    self.InstitutesArr=[[NSMutableArray alloc]init];
    HttpClient *client = [[HttpClient alloc]init];
    NSString *urlStr = @"http://asquares-mac-mini-2.local:8000/institutesnames.json";
    [client getServiceCall:urlStr andCompletion:^(id json, NSError *error) {
        if (error) {
            NSLog(@"%@",[error localizedDescription]);
        }
        if ([json isKindOfClass:[NSArray class]]) {
            self.jsonInstitutesArr=[[NSMutableArray alloc]init];
            [self.jsonInstitutesArr addObjectsFromArray:json];
           

        }
        self.jsonInstitutesArr = [self.jsonInstitutesArr filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(ANY courses LIKE[cd] %@)", self.seletedcoursestr]];
        
        NSLog(@"json institutes%@",self.jsonInstitutesArr);
        for (int i=0; i<self.jsonInstitutesArr.count; i++) {
            Institute *institute = [[Institute alloc]init];
            institute.name=[[self.jsonInstitutesArr objectAtIndex:i]valueForKey:@"name"];
            institute.email=[[self.jsonInstitutesArr objectAtIndex:i]valueForKey:@"email"];
            institute.phoneNumber=[[self.jsonInstitutesArr objectAtIndex:i]valueForKey:@"phone number"];
            institute.courses=[[self.jsonInstitutesArr objectAtIndex:i]valueForKey:@"courses"];
            institute.address=[[self.jsonInstitutesArr objectAtIndex:i]valueForKey:@"address"];
            
            
            [self.InstitutesArr addObject:institute];
            
            [self.tableView reloadData];
            
        }
        
            }];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"InstituteTableViewCell" bundle:nil] forCellReuseIdentifier:@"InstituteCell"];
    
    // Do any additional setup after loading the view.
}

#pragma mark - Private API

#pragma mark tableview delegate Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
        return self.InstitutesArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    InstituteTableViewCell *instituteTableViewCell=(InstituteTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"InstituteCell" forIndexPath:indexPath];
    instituteTableViewCell.institute = self.InstitutesArr[indexPath.row];
    [instituteTableViewCell updateCellAtIndexPath:indexPath];
    instituteTableViewCell.instituteViewDelegate = self;
    return instituteTableViewCell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
    
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

#pragma mark - InstituteViewControllerDelegate Methods

- (void)goToInstituteDetailViewWithInstitute:(Institute *)institute {
    [self performSegueWithIdentifier:@"InstituteDetail" sender:institute];
}

@end
