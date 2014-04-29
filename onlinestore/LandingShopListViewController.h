//
//  LandingShopListViewController.h
//  onlinestore
//
//  Created by Envision on 25/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "ShopItemCell.h"
#import "EGOImageView.h"
#import "BaseViewController.h"
@interface LandingShopListViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *tableObj;
}
@property(strong,nonatomic)NSMutableArray *arrObj,*iteamArrObj,*imageArry;
- (IBAction)shopIteam:(id)sender;

@end
