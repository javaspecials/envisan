//
//  LandingShopListViewController.m
//  onlinestore
//
//  Created by Envision on 25/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import "LandingShopListViewController.h"
#import "LoginViewController.h"
#import "ShopViewController.h"
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"
@interface LandingShopListViewController ()

@end

@implementation LandingShopListViewController
@synthesize arrObj,iteamArrObj,imageArry;
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
   // [self setHeaderView:YES];
   // [self dismissViewControllerAnimated:YES completion:nil];
   self.navigationController.navigationBarHidden = YES;
	// Do any additional setup after loading the view.
    
    
    NSString *urlString=[NSString stringWithFormat:@"http://68.169.52.119/Fetchshpwpbyid/454545"];
    
    
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
            
            imageArry = [responseDict valueForKey:@"picture"];
            NSLog(@"%@",imageArry);
            
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
    
    
    /*ShopItemCell *cell;
    static NSString *CellIdentifier = @"ShopItemCell";
	cell = (ShopItemCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
	if (cell == nil) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"ShopItemCell" owner:self options:nil];
        cell = (ShopItemCell *)[array objectAtIndex:0];
        
        cell.title.text=iteamArrObj[indexPath.row];
        // NSArray *strObj = [NSString stringWithFormat:@"%id",mrpArr ]
        //cell.price.text =[mrpArr[indexPath.row] stringValue];*/
    }
    cell.textLabel.text = [iteamArrObj objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[imageArry objectAtIndex:0]];
   /* EGOImageView *imageIconView=[[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"icon72x72.png"]];
    imageIconView.imageURL = [NSURL URLWithString:imageArry[indexPath.row]];
    imageIconView.frame=CGRectMake(0, 0, 62, 71);
    [cell addSubview:imageIconView];*/
    return cell;
    
}

#pragma mark - UISearchDisplayController delegate methods

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 107;
//    
//}
-(void)viewWillDisappear:(BOOL)animated
{
    
    //UITableView *tv = (UITableView *)self.view;
    
   // [tv beginUpdates];
    
    //[tv insertRowsAtIndexPaths:insertIndexPaths withRowAnimation:UITableViewRowAnimationRight];
    //[tv deleteRowsAtIndexPaths:deleteIndexPaths withRowAnimation:UITableViewRowAnimationFade];
    
    //[tv insertRowsAtIndexPaths:iteamArrObj withRowAnimation:UITableViewRowAnimationAutomatic];
    //[tv endUpdates];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

- (IBAction)shopIteam:(id)sender {
    
    
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
//    ShopViewController *shopList = [sb instantiateViewControllerWithIdentifier:@"ShopViewController"];
//    [self.navigationController pushViewController:shopList animated:YES];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    LoginViewController *shopList = [sb instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self presentViewController:shopList animated:YES completion:nil];
    //[self.navigationController pushViewController:shopList animated:YES];

    

}
@end
