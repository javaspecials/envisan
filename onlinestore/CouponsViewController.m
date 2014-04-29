//
//  OffersAndDealsViewController.m
//  onlinestore
//
//  Created by Envision on 15/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import "CouponsViewController.h"

#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"
#import "WebViewCell.h"


NSMutableArray *dealsArray;

@interface CouponsViewController ()

@end

@implementation CouponsViewController

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
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:@"http://68.169.52.119/Couponsinfo.json"]];
    //[request setRequestMethod:@"GET"];
    [request setDelegate:self];
    [request startAsynchronous];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading Coupons...";
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark WebServiceDelegate Methods



- (void)requestFinished:(ASIHTTPRequest *)request
{
    
    NSError *jsonError;
    
    if (request.responseStatusCode == 400) {
        //textViewWS.text = @"Invalid code";
    } else if (request.responseStatusCode == 403)
    {
        //  textViewWS.text = @"Code already used";
    } else if (request.responseStatusCode == 200) {
        
        
        NSData *responseData=[request responseData];
        NSMutableArray *responseArr = [NSJSONSerialization
                                       JSONObjectWithData:responseData
                                       options:NSJSONReadingMutableLeaves
                                       error:&jsonError];
        dealsArray=responseArr;
        
        [self.couponsTableView reloadData];
        
        
        
    } else {
        NSString *message=[NSString stringWithFormat:@"UnExpected Error..Please try again"];
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    NSLog(@"ERROR: %@",request);
    
}


- (void)requestFailed:(ASIHTTPRequest *)request
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    NSString *message=[NSString stringWithFormat:@"No network coverage..Please try again"];
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [dealsArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WebViewCell *cell;
    static NSString *CellIdentifier = @"WebViewCell";
	cell = (WebViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
	if (cell == nil) {
		NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"WebViewCell" owner:self options:nil];
        
		cell = (WebViewCell *)[array objectAtIndex:0];
        
	}
    
    NSString *html=[[dealsArray objectAtIndex:indexPath.section] objectForKey:@"coupon"];
    
    [cell.webView loadHTMLString:html baseURL:nil];
    
    
    return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180;

}

@end

