//
//  NearByMallsViewController.m
//  MoDoc
//
//  Created by Rajasekhar on 01/05/14.
//  Copyright (c) 2014 sudheer ravella. All rights reserved.
//

#import "SignUpViewController.h"
#import "PDLocationsMap.h"

#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"


NSString *LAT=@"17.435977";
NSString *LOG=@"78.456481";
NSString *RADIUS=@"5000";

@interface SignUpViewController ()

@end

NSMutableArray *nearByMallsArray;
PDLocationsMapViewController *locationsMapViewController;
@implementation SignUpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    nearByMallsArray=[[NSMutableArray alloc] init];
    
    [self setHeaderView:YES];
    // Do any additional setup after loading the view from its nib.
    
    NSString *urlString=[NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=%@,%@&radius=%@&types=shopping_mall&sensor=false&key=AIzaSyD1Tert5t6dYtZZ7KWJlC01hb1mk5pqyxM",LAT,LOG,RADIUS];
    
    

   
    NSURL *apiUrl = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
     ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:apiUrl];
    [request setDelegate:self];
    [request startAsynchronous];
    
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading Shop Items..";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)selectMallTap:(id)sender{

   locationsMapViewController= [[PDLocationsMapViewController alloc] initWithDelegate:self andDataSource:self];

    [self presentViewController:locationsMapViewController animated:YES
                     completion:nil];



}
#pragma mark -
#pragma mark PDLocationsMapView

- (NSArray *)locationsForShowingInLocationsMap {
  
    NSMutableArray *tempArray=[[NSMutableArray alloc] init];
    
    for (int i=0; i<[nearByMallsArray count]; i++) {
        PDLocation *location=[[PDLocation alloc] initWithName:[[nearByMallsArray objectAtIndex:i] objectForKey:@"name"]
                                                  description:[[nearByMallsArray objectAtIndex:i] objectForKey:@"vicinity"]
                                                  andLocation:CLLocationCoordinate2DMake([[[[[nearByMallsArray objectAtIndex:i] objectForKey:@"geometry"] objectForKey:@"location"] objectForKey:@"lat"] doubleValue]
                                                                                         ,[[[[[nearByMallsArray objectAtIndex:i] objectForKey:@"geometry"] objectForKey:@"location"] objectForKey:@"lng"] doubleValue])];
        [tempArray addObject:location];
        
 
    }
    return tempArray;
    
    
  //  return [NSArray arrayWithObjects:loc1, loc2, loc3,loc4,nil];




}

- (void)didSelectLocationAtIndex:(int)index {
    
    
}

#pragma mark UITableViewDatasource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return [[arrObj objectAtIndex:section]count];
    return 1;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

 return [nearByMallsArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     NSString *cellIdentifier = @"Cell";
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
     if (cell == nil) {
     cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
     }
     
     cell.textLabel.text = [[nearByMallsArray objectAtIndex:indexPath.section] objectForKey:@"name"];
     cell.detailTextLabel.text = @"subtext";//[[nearByMallsArray objectAtIndex:indexPath.section] objectForKey:@"vicinity"];
     return cell;
    
//    ShopItemCell *cell;
//    static NSString *CellIdentifier = @"ShopItemCell";
//	cell = (ShopItemCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    
//	if (cell == nil) {
//        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"ShopItemCell" owner:self options:nil];
//        cell = (ShopItemCell *)[array objectAtIndex:0];
//        
//        cell.title.text=nameArrObj[indexPath.row];
//    }
//    EGOImageView *imageIconView=[[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"icon72x72.png"]];
//    imageIconView.imageURL = [NSURL URLWithString:imageArrObj[indexPath.row]];
//    imageIconView.frame=CGRectMake(0, 0, 62, 71);
//    [cell addSubview:imageIconView];
//    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
// - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 107;
//
//}
#pragma mark -
#pragma mark ASIFormDataRequest Delegate Methods

- (void)requestFinished:(ASIHTTPRequest *)request
{
    
    
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    if (request.responseStatusCode == 400) {
        
    } else if (request.responseStatusCode == 403) {
        
    } else if (request.responseStatusCode == 200) {
        
        
        NSError *jsonError;
        NSDictionary *responseDict = [NSJSONSerialization
                                      JSONObjectWithData:request.responseData
                                      options:NSJSONReadingMutableLeaves
                                      error:&jsonError];
        
        if (responseDict!=nil)
        {
            
            nearByMallsArray=[responseDict objectForKey:@"results"];
            [tableViewNearByMalls reloadData];
            
        }else{
            
            NSString *message=[NSString stringWithFormat:@"Problem in Fectching Shop Items.Please try later.."];
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            
        }
        
    } else {
        NSString *message=[NSString stringWithFormat:@"UnExpected Error..Please try again"];
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    NSString *message=[NSString stringWithFormat:@"Something went wrong.Probably No network coverage..Please try again"];
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}



@end
