//
//  Wish1ViewController.m
//  onlinestore
//
//  Created by Envision on 23/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import "UserProductSelectionListViewController.h"
#import "WishDisplayViewController.h"
#import "PlanToByeViewController.h"
#import "GroceriesViewController.h"
#import "WishListViewController.h"

@interface UserProductSelectionListViewController ()

@end

@implementation UserProductSelectionListViewController
@synthesize myscroolObj;
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
    
    [self setHeaderView:YES];
   // self.navigationController.navigationBarHidden = NO;
   // self.edgesForExtendedLayout = UIRectEdgeNone;
//    
//    Segment.selectedSegmentIndex = 0;
//    
//    shop=[[ShopViewController alloc]initWithNibName:@"ShopViewController" bundle:nil];
//    [contentViewObj addSubview:shop.view];
    
    Segment.selectedSegmentIndex = 0;
    //plan=[[PlanToByeViewController alloc]initWithNibName:@"PlanToByeViewController" bundle:nil];
    //shop = [self.storyboard instantiateViewControllerWithIdentifier:@"ShopViewController"];
    landingShopList = [self.storyboard instantiateViewControllerWithIdentifier:@"LandingShopListViewController"];
    [contentViewObj addSubview:landingShopList.view];

    
//    [myscroolObj setScrollEnabled:YES];
//    [myscroolObj setContentSize:CGSizeMake(320, 1000)];
   // [self.contanerview addsubeview:wish1}
    
    


}
- (IBAction)segmentBtnTapp:(id)sender {
    
    UISegmentedControl *segmented=(UISegmentedControl*)sender;
    
    switch (segmented.selectedSegmentIndex) {
        case 0:
            // fv=[[FirstView alloc]initWithNibName:@"FirstView" bundle:nil];
            [contentViewObj addSubview:landingShopList.view];
            
            break;
            
        case 1:
            landingWishList = [self.storyboard instantiateViewControllerWithIdentifier:@"LandingWishListViewController"];
            //wish=[[WishList2ViewController alloc]initWithNibName:@"WishList2ViewController" bundle:nil];
            [contentViewObj addSubview:landingWishList.view];
            
            break;
            
        case 2:
            
            landingPlanToBuy = [self.storyboard instantiateViewControllerWithIdentifier:@"LandingPlanToBuyListViewController"];
            //plan=[[PlanToByeViewController alloc]initWithNibName:@"PlanToByeViewController" bundle:nil];
            [contentViewObj addSubview:landingPlanToBuy.view];
            
            break;
            
        case 3:
            landingGroceriesList = [self.storyboard instantiateViewControllerWithIdentifier:@"LandingGroceriesListViewController"];
            
            //grocies=[[GroceriesViewController alloc]initWithNibName:@"GroceriesViewController" bundle:nil];
            [contentViewObj addSubview:landingGroceriesList.view];
            
            break;
            
        default:
            break;
     
    }
    
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
