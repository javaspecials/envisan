//
//  WishListViewController.m
//  onlinestore
//
//  Created by Envision on 22/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import "LandingWishListViewController.h"
#import "UserProductSelectionListViewController.h"
#import "WishListViewController.h"
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"
@interface LandingWishListViewController ()

@end

@implementation LandingWishListViewController
@synthesize myScroolObj,arrObj,strObj,iteamArrObj;
   int num;

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
	// Do any additional setup after loading the view.
    
    //[self setHeaderView:YES];
    
    //[self addItemToArray];
    self.navigationController.navigationBarHidden = YES;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    //arrObj = [[NSArray alloc]initWithObjects:@"Iteam1",@"Iteam2", nil];
    
 
    
    [myScroolObj setScrollEnabled:YES];
    [myScroolObj setContentSize:CGSizeMake(320, 1200)];
    
    self.title = @"Items";
    
    NSString *urlString=[NSString stringWithFormat:@"http://68.169.52.119/Fetchwishlstbyid/454545"];
    
    
    ////WEBSERVICE CALL
    NSURL *url = [NSURL URLWithString:urlString];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setDelegate:self];
    [request startAsynchronous];
    
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading Shop Items..";
   
}
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
            NSLog(@"responseDict is %@",[responseDict valueForKey:@"item"]);
            
            iteamArrObj =[responseDict valueForKey:@"item"];
            NSLog(@"%@",iteamArrObj);
            
            [tableObj reloadData];
            
            
            
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


-(void)viewDidDisappear:(BOOL)animated
{

}
-(void)viewWillDisappear:(BOOL)animated
{
   [tableObj reloadData];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)barIteamBtn:(id)sender {
    
    

    WishListViewController *wish = [self.storyboard instantiateViewControllerWithIdentifier:@"WishListViewController"];
    [self presentViewController:wish animated:YES completion:nil];
   // [self.navigationController pushViewController:wish animated:YES];

    

    
}








#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [iteamArrObj count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [iteamArrObj objectAtIndex:indexPath.row];
    return cell;
    
}
@end
