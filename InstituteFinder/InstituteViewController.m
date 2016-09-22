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
#import "IFInsitute.h"
#import "AppDelegate.h"

@interface InstituteViewController () <InstituteViewControllerProtocol>

@property(nonatomic,strong)NSMutableArray *jsonInstitutesArr;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *InstitutesArr;
@property(nonatomic,strong)NSMutableArray *coreDataArr;


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
    _coreDataArr=[[NSMutableArray alloc]init];
    
}
- (void)PrepareView{
    [[IFHttpClient sharedHttpClient]getInstitutesWithParameters:nil
success:^(NSArray *result) {
    if ([result isKindOfClass:[NSArray class]]) {
        [self.jsonInstitutesArr addObjectsFromArray:result];
        NSLog(@"json institutes%@",self.jsonInstitutesArr);
        
        __block NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(ANY courses LIKE[cd] %@)", self.seletedcoursestr];
        
         _jsonInstitutesArr = [[self.jsonInstitutesArr filteredArrayUsingPredicate:predicate] mutableCopy];
        
         NSManagedObjectContext *managedContext = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;
    
        AppDelegate *delegate = [[UIApplication sharedApplication]  delegate];
        
        [IFInsitute insertInstituteWithInstituteData:self.jsonInstitutesArr context:[delegate managedObjectContext] withCompletionHandler:^(IFInsitute * _Nonnull institute) {

            
            NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"IFInsitute"];
//            fetchRequest.resultType = NSCountResultType;
            NSError *fetchError = nil;
            
//            [fetchRequest setPredicate:predicate];
            
//            NSUInteger itemsCount = [managedContext countForFetchRequest:fetchRequest error:&fetchError];
//            NSLog(@"Items count %lu", (unsigned long)itemsCount);
            
            NSError *error = nil;

            _coreDataArr = [[managedContext executeFetchRequest:fetchRequest error:&error] mutableCopy];

            [self.tableView reloadData];

//            if (itemsCount == NSNotFound) {
//                NSLog(@"Fetch error: %@", fetchError);
//            }
            
            
        }];
        
//        _jsonInstitutesArr = [self.jsonInstitutesArr filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(ANY courses LIKE[cd] %@)", self.seletedcoursestr]];
//        
//        for (int i=0; i<self.jsonInstitutesArr.count; i++) {
//            Institute *institute = [[Institute alloc]init];
//            institute.name=[[self.jsonInstitutesArr objectAtIndex:i]valueForKey:@"name"];
//            institute.email=[[self.jsonInstitutesArr objectAtIndex:i]valueForKey:@"email"];
//            institute.phoneNumber=[[self.jsonInstitutesArr objectAtIndex:i]valueForKey:@"phone number"];
//            institute.courses=[[self.jsonInstitutesArr objectAtIndex:i]valueForKey:@"courses"];
//            institute.address=[[self.jsonInstitutesArr objectAtIndex:i]valueForKey:@"address"];
//             institute.imageurl=[[self.jsonInstitutesArr objectAtIndex:i]valueForKey:@"url"];
//            
//            [self.InstitutesArr addObject:institute];
//            
//        }
        [self.tableView reloadData];
        
        


    }
}
failure:^(NSError *error) {
    
}];

//    self
    
//    [self.tableView registerNib:[UINib nibWithNibName:@"InstituteTableViewCell" bundle:nil] forCellReuseIdentifier:@"InstituteCell"];
    
    // Do any additional setup after loading the view.
}

#pragma mark - Private API

#pragma mark tableview delegate Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
        return _coreDataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    InstituteTableViewCell *instituteTableViewCell=(InstituteTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"InstituteCell" forIndexPath:indexPath];
    instituteTableViewCell.iFInsitute = _coreDataArr[indexPath.row];
    [instituteTableViewCell updateCellAtIndexPath:indexPath];
    instituteTableViewCell.instituteViewDelegate = self;
    return instituteTableViewCell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"InstituteDetail" sender:[_coreDataArr objectAtIndex:indexPath.row]];
//    [self performSegueWithIdentifier:@"InstituteDetail" sender:[self.InstitutesArr objectAtIndex:indexPath.row]];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    InstituteDetailViewController *institute=[segue destinationViewController];
    institute.InstituteDetailArr=sender;
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
