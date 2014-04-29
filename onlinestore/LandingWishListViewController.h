//
//  WishListViewController.h
//  onlinestore
//
//  Created by Envision on 22/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface LandingWishListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *tableObj;
}
- (IBAction)barIteamBtn:(id)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *myScroolObj;

@property(strong,nonatomic)NSMutableArray *arrObj,*iteamArrObj;
@property(strong,nonatomic)NSString *strObj;
@end
