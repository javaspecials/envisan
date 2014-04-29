//
//  PriceCompareDisplayViewController.m
//  onlinestore
//
//  Created by Envision on 02/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import "PriceCompareDisplayViewController.h"
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"
@interface PriceCompareDisplayViewController ()

@end

@implementation PriceCompareDisplayViewController
@synthesize skuStr,commntsArObj,ratingArObj,imgStr,titleArObj,desStr,priceImg;

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
    [self.myScrool setScrollEnabled:YES];
    [self.myScrool setContentSize:CGSizeMake(320, 700)];
	// Do any additional setup after loading the view.
     [self setHeaderView:YES];
    //self.navigationController.navigationBarHidden = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    NSURL *url=[NSURL URLWithString:imgStr];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    
    UIImage *tmpImage = [[UIImage alloc] initWithData:data];
    priceImg.image = tmpImage;
    // priceImg.image=tmpImage;
    
    NSLog(@"sku :%@",skuStr);
    
    // NSString *urlString=[NSString stringWithFormat:@"http://api.remix.bestbuy.com/v1/reviews(sku in(%@)&rating in(0,1,2,3,4))?show=sku,rating,title,comment&apiKey=n4s4v9nh78mfbnq4ttn3a76y&format=json",skuStrObj];
    
    ////WEBSERVICE CALL
    NSString *urlString=[NSString stringWithFormat:@"http://api.remix.bestbuy.com/v1/products/%@.json?apiKey=n4s4v9nh78mfbnq4ttn3a76y",skuStr];
    
    
    
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
            
            NSArray *arr=[responseDict valueForKey:@"regularPrice"];
            NSLog(@"regular:%@",arr);
            self.priceLbl.text = [NSString stringWithFormat:@"%@",arr];
            NSArray *arrSal=[responseDict valueForKey:@"salePrice"];
            NSLog(@"sale:%@",arrSal);
            self.salePrice.text = [NSString stringWithFormat:@"%@",arrSal];
            //commentTextObj.text = [NSString stringWithFormat:@"%@",productArrObj];
            // [tableViewObj reloadData];
            
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




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
