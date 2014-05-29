//
//  BrowsAndShopViewController.m
//  onlinestore
//
//  Created by Envision on 02/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import "BrowsAndShopViewController.h"
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"
#import "BrowsDisplayViewController.h"
#import "ItemDetailViewController.h"
#import "ShopItemCell.h"
#import "EGOImageView.h"
@interface BrowsAndShopViewController ()

@end

@implementation BrowsAndShopViewController
@synthesize arrTitle,searchBarObj,imgArry,iteamIdArr,bleIdArr,nameArry,shortDecArray,iteamPromoMsgArr,cpArr,mrpArr,spArr,itemUrlArr,codeIdArr,promoMsgArr,createdByArr,createdDateArry,modifiedByArr,modifiedDateArr,decArr,cateIdArr,skuCodeArr;
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
    // Do any additional setup after loading the view.
    
    
   // self.navigationController.navigationBarHidden = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.searchReasultObj = [NSMutableArray arrayWithCapacity:[decArr count]];
    
    tableViewObj.tableHeaderView = searchBarObj;
    
    
    [self getDetails];
}


-(void)getDetails
{
       /* NSData *jdata = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"catlog" ofType:@"json"]];
    
        NSError *error ;
        NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:jdata options:NSJSONReadingMutableContainers error:&error];
        //NSLog(@"data:%@",[[[dict objectForKey:@"categories"]valueForKey:@"name"]objectAtIndex:2]);
       imgArry= [[dict objectForKey:@"categories"]valueForKey:@"catgimgurl"];
    NSLog(@"%@",imgArry);
      //  nameArry = [[[dict objectForKey:@"categories"]valueForKey:@"items"]valueForKey:@"name"];
        NSLog(@"itam:%@",nameArry);*/
    
    NSString *urlString=[NSString stringWithFormat:@"http://68.169.52.119/Skumastr.json"];
    
    
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
    
    NSMutableDictionary *itemDic=[[NSMutableDictionary alloc]init];
    
    [itemDic setObject:[imgArry objectAtIndex:indexPath.row] forKey:@"imageURL"];
    [itemDic setObject:[iteamIdArr objectAtIndex:indexPath.row] forKey:@"id"];
    [itemDic setObject:[decArr objectAtIndex:indexPath.row] forKey:@"name"];
    [itemDic setObject:@"" forKey:@"description"];
    [itemDic setObject:[cpArr objectAtIndex:indexPath.row] forKey:@"cp"];
    [itemDic setObject:[mrpArr objectAtIndex:indexPath.row] forKey:@"mrp"];
    [itemDic setObject:[spArr objectAtIndex:indexPath.row] forKey:@"sp"];

    
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    ItemDetailViewController *vc = [sb instantiateViewControllerWithIdentifier:@"ItemDetailViewController"];
    vc.itemDetailDictionary=itemDic;
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
