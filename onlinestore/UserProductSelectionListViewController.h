//
//  Wish1ViewController.h
//  onlinestore
//
//  Created by Envision on 23/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "ShopViewController.h"
#import "WishListViewController.h"
#import "PlanToByeViewController.h"
#import "GroceriesViewController.h"

#import "LandingShopListViewController.h"
#import "LandingWishListViewController.h"
#import "LandingPlanToBuyListViewController.h"
#import "LandingGroceriesListViewController.h"

@interface UserProductSelectionListViewController : BaseViewController
{
    IBOutlet UISegmentedControl *Segment;
    IBOutlet UIView *contentViewObj;
    
    LandingShopListViewController *landingShopList;
    LandingWishListViewController *landingWishList;
    LandingPlanToBuyListViewController *landingPlanToBuy;
    LandingGroceriesListViewController *landingGroceriesList;
    
    ShopViewController *shop;
    WishListViewController *wish;
    PlanToByeViewController *plan;
    GroceriesViewController *grocies;
    
}
@property (weak, nonatomic) IBOutlet UIScrollView *myscroolObj;

/*- (IBAction)planBtn:(id)sender;

- (IBAction)segmentCntrrlTapped:(id)sender;

- (IBAction)browseBtn:(id)sender;*/

- (IBAction)segmentBtnTapp:(id)sender;

@end
