//
//  ProductDisplayViewController.m
//  onlinestore
//
//  Created by Envision on 02/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import "ProductDisplayViewController.h"
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"
#import "DYRateView.h"
@interface ProductDisplayViewController ()

@end

@implementation ProductDisplayViewController
@synthesize imgObj,desTextObj,comentTextObj,scrolObj,skuStrObj,commntsArObj,ratingArObj,imgStr,titleArObj,desStr,productArrObj;
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
    
    DYRateView *rateView = [[DYRateView alloc] initWithFrame:CGRectMake(200, 160, 160, 14)];
    rateView.rate = 4;    rateView.alignment = RateViewAlignmentLeft;
    [self.scrolObj addSubview:rateView];
    
	// Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    NSURL *url=[NSURL URLWithString:imgStr];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    
    UIImage *tmpImage = [[UIImage alloc] initWithData:data];
    imgObj.image=tmpImage;
    
    desTextObj.text =[NSString stringWithFormat:@"%@", desStr];
    NSLog(@"sku :%@",desTextObj.text);
    
    NSLog(@"sku :%@",skuStrObj);
    
    NSString *urlString=[NSString stringWithFormat:@"http://api.remix.bestbuy.com/v1/reviews(sku in(%@)&rating in(0,1,2,3,4))?show=sku,rating,title,comment&apiKey=n4s4v9nh78mfbnq4ttn3a76y&format=json",skuStrObj];
    
    ////WEBSERVICE CALL
    //NSString *urlString=[NSString stringWithFormat:@"http://api.remix.bestbuy.com/v1/products/%@.json?apiKey=n4s4v9nh78mfbnq4ttn3a76y",skuStrObj];
    
    
    
    NSURL *apiUrl = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    // NSURL *urlObj = [NSURL URLWithString:urlString];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:apiUrl];
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
            NSLog(@"responseDict is %@",responseDict );
            
            
            productArrObj =[responseDict objectForKey:@"reviews"];
            NSLog(@"name %@:",productArrObj);
            
            titleArObj = [productArrObj valueForKey:@"title"];
            NSLog(@"title %@:",titleArObj);
            
            ratingArObj = [productArrObj valueForKey:@"rating"];
            NSLog(@"rating %@:",ratingArObj);
            
            commntsArObj = [productArrObj valueForKey:@"comment"];
            
            NSLog(@"coment %@:",commntsArObj);
            
            for (int i=0; [productArrObj count]>i ; i++) {
                comentTextObj.text = [NSString stringWithFormat:@"%@",[commntsArObj objectAtIndex:i ]] ;
                
            }
            
           self.ratingLbl.text = [NSString stringWithFormat:@"%ld",(unsigned long)[commntsArObj  count]];
            //commentTextObj.text = [NSString stringWithFormat:@"%@",productArrObj];
            
            [table reloadData];
            
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
    
    
    [scrolObj setScrollEnabled:YES];
    [scrolObj setContentSize:CGSizeMake(320, 1200)];
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    NSString *message=[NSString stringWithFormat:@"Something went wrong.Probably No network coverage..Please try again"];
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [commntsArObj count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 102;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*NSString *identifier = @"Cellidentifier";
    TableCell *cell = (TableCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
      NSArray *nib =  [[NSBundle mainBundle]loadNibNamed:@"CustomCCell" owner:self options:nil];
        // cell = [nib objectAtIndex:0];
        cell=[nib objectAtIndex:0];
    }*/
    
    TableCell *cell;
    static NSString *CellIdentifier = @"TableCell";
	cell = (TableCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
	if (cell == nil) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"TableCell" owner:self options:nil];
        cell = (TableCell *)[array objectAtIndex:0];
     
    }
     cell.commentsLbl.text = [commntsArObj objectAtIndex:indexPath.row];
    cell.title.text=[titleArObj objectAtIndex:indexPath.row];
    DYRateView *rateView = [[DYRateView alloc] initWithFrame:CGRectMake(200, 0, 160, 14)];
    rateView.rate = [[ratingArObj objectAtIndex:indexPath.row] floatValue];
    rateView.alignment = RateViewAlignmentLeft;
    [cell.contentView addSubview:rateView];
    
  
    
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
