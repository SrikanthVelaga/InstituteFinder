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
#import "InstituteTableViewCell.h"
#import "IFHttpClient.h"

@interface InstituteViewController () <InstituteViewControllerProtocol>

@property(nonatomic,strong)NSMutableArray *jsonInstitutesArr;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *InstitutesArr;


@end

@implementation InstituteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self InitializedObjects];
    [self PrepareView];
}
- (void)InitializedObjects
{
    _jsonInstitutesArr=[[NSMutableArray alloc]init];
    _InstitutesArr = [[NSMutableArray alloc] init];
    
}
- (void)PrepareView{
    [[IFHttpClient sharedHttpClient]getInstitutesWithParameters:nil
success:^(NSArray *result) {
    if ([result isKindOfClass:[NSArray class]]) {
        [self.jsonInstitutesArr addObjectsFromArray:result];
        NSLog(@"json institutes%@",self.jsonInstitutesArr);
        _jsonInstitutesArr = [self.jsonInstitutesArr filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(ANY courses LIKE[cd] %@)", self.seletedcoursestr]];
        
        for (int i=0; i<self.jsonInstitutesArr.count; i++) {
            Institute *institute = [[Institute alloc]init];
            institute.name=[[self.jsonInstitutesArr objectAtIndex:i]valueForKey:@"name"];
            institute.email=[[self.jsonInstitutesArr objectAtIndex:i]valueForKey:@"email"];
            institute.phoneNumber=[[self.jsonInstitutesArr objectAtIndex:i]valueForKey:@"phone number"];
            institute.courses=[[self.jsonInstitutesArr objectAtIndex:i]valueForKey:@"courses"];
            institute.address=[[self.jsonInstitutesArr objectAtIndex:i]valueForKey:@"address"];
             institute.imageurl=[[self.jsonInstitutesArr objectAtIndex:i]valueForKey:@"url"];
            
            [self.InstitutesArr addObject:institute];
            
        }
        [self.tableView reloadData];
        
        


    }
}
failure:^(NSError *error) {
    
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
