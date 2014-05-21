//
//  ShopDisplayViewController.m
//  onlinestore
//
//  Created by Envision on 03/05/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import "ShopDisplayViewController.h"
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"
#import "ShopItemCell.h"
#import "EGOImageView.h"
#import "LandingWishListViewController.h"
#import "LandingShopListViewController.h"
#import "LandingPlanToBuyListViewController.h"

@interface ShopDisplayViewController ()

@end
NSMutableDictionary *dic;
ASIFormDataRequest *getRequest;
ASIFormDataRequest *postRequest;
@implementation ShopDisplayViewController
@synthesize arrTitle,imgArry,iteamIdArr,bleIdArr,nameArry,shortDecArray,iteamPromoMsgArr,cpArr,mrpArr,spArr,itemUrlArr,codeIdArr,promoMsgArr,createdByArr,createdDateArry,modifiedByArr,modifiedDateArr,decArr,cateIdArr,skuCodeArr,arrWish ;
@synthesize totaArrObj,totArObj;
ASIFormDataRequest *categoriesRequest;

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
    self.searchReasultObj = [NSMutableArray arrayWithCapacity:[decArr count]];
    //searchBarObj=[[UISearchBar alloc]init];
    //searchBarObj = [[UISearchBar alloc]init];
    tableObj.tableHeaderView = self.searchDisplay;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    NSString *urlString=[NSString stringWithFormat:@"http://68.169.52.119/Skumastr.json"];
    
    
    ////WEBSERVICE CALL
    NSURL *url = [NSURL URLWithString:urlString];
    getRequest = [ASIFormDataRequest requestWithURL:url];
    [getRequest setDelegate:self];
    [getRequest startAsynchronous];
    
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading Shop Items..";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark ASIFormDataRequest Delegate Methods

- (void)requestFinished:(ASIHTTPRequest *)request
{
    
    if (getRequest==request) {
        
        
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
                //NSLog(@"responseDict is %@",[responseDict objectForKey:@"products"]);
                
                // NSArray *productArrObj =[responseDict objectForKey:@"products"];
                NSLog(@"name %@:",responseDict);
                
                decArr = [responseDict valueForKey:@"skulongdesc"];
                NSLog(@"name %@:",decArr);
                iteamIdArr = [responseDict valueForKey:@"id"];
                NSLog(@"id %@:",iteamIdArr);
                
                skuCodeArr = [responseDict valueForKey:@"skucode"];
                NSLog(@"skucode %@:",skuCodeArr);
                
                imgArry = [responseDict valueForKey:@"skuurl"];
                NSLog(@"img %@:",imgArry);
                cpArr = [responseDict valueForKey:@"cp"];
                NSLog(@"cp %@:",decArr);
                mrpArr = [responseDict valueForKey:@"mrp"];
                NSLog(@"mrp %@:",iteamIdArr);
                spArr = [responseDict valueForKey:@"sp"];
                NSLog(@"sp %@:",imgArry);
                cateIdArr = [responseDict valueForKey:@"catg_id"];
                NSLog(@"catgid %@:",cateIdArr);
                
                modifiedDateArr = [responseDict valueForKey:@"modifieddate"];
                NSLog(@"modifidate %@:",modifiedDateArr);
                
                modifiedByArr = [responseDict valueForKey:@"modifiedby"];
                NSLog(@"modifiby %@:",modifiedByArr);
                
                createdDateArry = [responseDict valueForKey:@"createddate"];
                NSLog(@"createddate %@:",createdDateArry);
                
                createdByArr = [responseDict valueForKey:@"createdby"];
                NSLog(@"createdby %@:",createdByArr);
                //NSLog(@"name %@:",createdByArr);
                
                
                [tableObj reloadData];
                
            }
            else {
                NSString *message=[NSString stringWithFormat:@"UnExpected Error..Please try again"];
                UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
            
        }
    }else if(postRequest==request) {
        
        
        
        //Categories
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        if (request.responseStatusCode == 400) {
            
        } else if (request.responseStatusCode == 403) {
            
        } else if (request.responseStatusCode == 200) {
            
            
            //[self prepareDataFromJSONData:request.responseData];
            // [self prepareDataFromJSONDataForitemList:request.responseData];
            
            
            
            // NSDictionary *categoryDic=[categories objectAtIndex:selectedCategoryIndex];
            //int categoryId=[[categoryDic objectForKey:@"id"] intValue];
            
            //  [self sendItemsRequestWithCategoryId:categoryId];
            //[self sendPromoItemsRequestWithCategoryId:categoryId];
            
            NSString *str = [[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding];
            NSLog(@"%@",str);
            
            LandingShopListViewController *planList = [self.storyboard instantiateViewControllerWithIdentifier:@"LandingShopListViewController"];
            [self presentViewController:planList animated:YES completion:nil];
            
            
            if ([str isEqualToString:@"true"]) {
                UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"" message:@"Saved Successfully" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                
                [alert show];
            }else{
                UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"" message:@"Not Saved" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                
                [alert show];
            }
            
            
        } else {
            NSString *message=[NSString stringWithFormat:@"UnExpected Error..Please try again"];
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    NSString *message=[NSString stringWithFormat:@"Something went wrong.Probably No network coverage..Please try again"];
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}



#pragma Searchbar

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    [self.searchReasultObj removeAllObjects];
    //[self.searchReasultObj removeAllObjects];h
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@", searchText];
    
    self.searchReasultObj = [NSMutableArray arrayWithArray: [decArr filteredArrayUsingPredicate:resultPredicate]];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    
    
    return YES;
}

#pragma mark TableView

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        return [self.searchReasultObj count];
    }
    else
    {
        return [decArr count];
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
     NSString *identifier = @"Cellidentifier";
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
     if (cell == nil) {
     cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
     }
     if (tableView == self.searchDisplayController.searchResultsTableView)
     {
     cell.textLabel.text = [self.searchReasultObj objectAtIndex:indexPath.row];
     }
     else
     {
     cell.textLabel.text = decArr[indexPath.row];
     }
     //cell.imageView.image =[UIImage imageNamed:@"tabl-bg-plain.png"];
     cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
     return cell;
     
     */
    
    
    
    ShopItemCell *cell;
    static NSString *CellIdentifier = @"ShopItemCell";
	cell = (ShopItemCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
	if (cell == nil) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"ShopItemCell" owner:self options:nil];
        cell = (ShopItemCell *)[array objectAtIndex:0];
        
        cell.title.text=decArr[indexPath.row];
        // NSArray *strObj = [NSString stringWithFormat:@"%id",mrpArr ]
        cell.price.text =[mrpArr[indexPath.row] stringValue];
        
        //        if (tableView == self.searchDisplayController.searchResultsTableView) {
        //            cell.title.text = [_searchReasultObj objectAtIndex:indexPath.row];
        //            cell.price.text = [decArr objectAtIndex:indexPath.row];
        //        } else {
        //            cell.price.text = [decArr objectAtIndex:indexPath.row];
        //        }
        
        
	}
    
    
    EGOImageView *imageIconView=[[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"icon72x72.png"]];
    imageIconView.imageURL = [NSURL URLWithString:imgArry[indexPath.row]];
    imageIconView.frame=CGRectMake(0, 0, 62, 71);
    [cell addSubview:imageIconView];
    return cell;
    
    
}
#pragma mark - UISearchDisplayController delegate methods



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 107;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    //    LandingPlanToBuyListViewController *planList = [self.storyboard instantiateViewControllerWithIdentifier:@"LandingPlanToBuyListViewController"];
    //    [self presentViewController:planList animated:YES completion:nil];
    
    
    
    
    NSString *urlString=[NSString stringWithFormat:@"http://68.169.52.119/Shopwishplatems.json"];
    
    NSURL *someUrl = [[NSURL alloc]initWithString:urlString];
    ////WEBSERVICE CALL
    //    NSURL *url = [NSURL URLWithString:urlString];
    //    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    //    [request setDelegate:self];
    //    [request startAsynchronous];
    
    
    postRequest = [ASIFormDataRequest requestWithURL:someUrl];
    //    categoriesRequest = [ASIFormDataRequest requestWithURL:someUrl];
    //    [categoriesRequest setDelegate:self];
    //    [categoriesRequest startAsynchronous];
    //    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //    hud.labelText = @"Loading Shop Items..";
    
    //    [request setRequestMethod:@"POST"];
    //    [request setPostValue:self.useNameTxf.text forKey:@"username"];
    //    [request setPostValue:self.pwdTxt.text forKey:@"password"];
    //    [request setPostValue:self.fNameTxt.text forKey:@"firstname"];
    //    [request setPostValue:self.lNameTxt.text forKey:@"id"];
    //
    
    
    dic=[[NSMutableDictionary alloc] init];
    
    //[totaArrObj addObject:[decArr objectAtIndex:indexPath.row]];
    
    /*[dic setObject:@"1575095" forKey:@"id"];
     [dic setObject:@"dkaran" forKey:@"username"];
     [dic setObject:@"d4297" forKey:@"password"];
     [dic setObject:@"bpau" forKey:@"firstname"];*/
    
    
    [dic setObject:@"454545" forKey:@"userid"];
    
    [dic setObject:[decArr objectAtIndex:indexPath.row] forKey:@"item"];
    [dic setObject:@"S" forKey:@"SHOP_WISH_PLAN_MYCART"];
    
    
    
    //    [dic setObject:self.addressTxtView.text forKey:@"address1"];
    //    [dic setObject:self.stateNameTxf.text forKey:@"state"];
    //    [dic setObject:self.cityNameTxf.text forKey:@"city"];
    //[dic setObject:self.countryNameTxf.text forKey:@"country"];
    
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        
        
        [postRequest appendPostData:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
        [postRequest setDelegate:self];
        [postRequest startSynchronous];
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.labelText = @"Saving Details..";
    }
    //    [totaArrObj addObject:[decArr objectAtIndex:indexPath.row]];
    //    planList.iteamArrObj=totaArrObj ;
    //    NSLog(@"%@",planList.iteamArrObj);
    
    //    [self presentViewController:planList animated:YES completion:nil];
    
    //[self.navigationController pushViewController:shopList animated:YES];
    
    
    
    //planList.iteamArrObj = [decArr objectAtIndex:indexPath.row];
    
    
    //NSLog(@"%@",planList.iteamArrObj);
    
    
}

@end
