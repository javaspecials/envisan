//
//  ProductsViewController.m
//  onlinestore
//
//  Created by Envision on 24/03/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import "ProductsViewController.h"
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"
#import "ProductDisplayViewController.h"
#import "ShopItemCell.h"
#import "EGOImageView.h"

@interface ProductsViewController ()

@end

@implementation ProductsViewController
@synthesize skuArrObj,nameArrObj,imageArrObj,decArrObj,productArrObj;
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
    [self setHeaderView:YES];
    [self callSearchProductsWebService:@"mobile"];

    
}


-(IBAction)searchProducts{

    
    NSLog(@"%@",productName.text);
    
    nameArrObj = [productArrObj valueForKey:@"name"];
    NSLog(@"name %@:",nameArrObj);
    
    
    [self callSearchProductsWebService:productName.text];


}

-(void)callSearchProductsWebService:(NSString *)searchKey{
    NSString *urlString=[NSString stringWithFormat:@"http://api.remix.bestbuy.com/v1/products(name=%@*)?show=sku,name,image,shortDescription&apiKey=n4s4v9nh78mfbnq4ttn3a76y&format=json",searchKey];
    
    
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
            NSLog(@"responseDict is %@",[responseDict objectForKey:@"products"]);
            
            
            NSLog(@"responseDict is %@",[responseDict objectForKey:@"products"]);
            
           productArrObj =[responseDict objectForKey:@"products"];
            NSLog(@"name %@:",productArrObj);
            
            nameArrObj = [productArrObj valueForKey:@"name"];
            NSLog(@"name %@:",nameArrObj);
            
            skuArrObj = [productArrObj valueForKey:@"sku"];
            NSLog(@"sku %@:",skuArrObj);
            
            imageArrObj = [productArrObj valueForKey:@"image"];
            
            NSLog(@"image %@:",imageArrObj);
            decArrObj = [productArrObj valueForKey:@"shortDescription"];
            
            NSLog(@"image %@:",decArrObj);
            
            [tableViewObj reloadData];
            
            
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


#pragma TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return [[arrObj objectAtIndex:section]count];
    return [nameArrObj count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   /* NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [nameArrObj objectAtIndex:indexPath.row];
    //cell.detailTextLabel.text  =[skuArr objectAtIndex:indexPath.row];
    //cell.imageView.image = [UIImage imageNamed:@"1-screen.png"];
    
    return cell;*/
    
    ShopItemCell *cell;
    static NSString *CellIdentifier = @"ShopItemCell";
	cell = (ShopItemCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
	if (cell == nil) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"ShopItemCell" owner:self options:nil];
        cell = (ShopItemCell *)[array objectAtIndex:0];
        
        cell.title.text=nameArrObj[indexPath.row];
}
    EGOImageView *imageIconView=[[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"icon72x72.png"]];
    imageIconView.imageURL = [NSURL URLWithString:imageArrObj[indexPath.row]];
    imageIconView.frame=CGRectMake(0, 0, 62, 71);
    [cell addSubview:imageIconView];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 // - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // DisplayViewController *snObj = [[DisplayViewController alloc]initWithNibName:@"DisplayViewController" bundle:nil];
    UIStoryboard *sbObj = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    ProductDisplayViewController *dispObj =[sbObj instantiateViewControllerWithIdentifier:@"ProductDisplayViewController"];
    [self.navigationController pushViewController:dispObj animated:YES];
    //[self.navigationController pushViewController:dispObj animated:YES];
    
    dispObj.skuStrObj = [skuArrObj objectAtIndex:indexPath.row];
    
    dispObj.desStr = [decArrObj objectAtIndex:indexPath.row];
    dispObj.imgStr=[imageArrObj objectAtIndex:indexPath.row];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 107;
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
