//
//  LandingGroceriesListViewController.h
//  onlinestore
//
//  Created by Envision on 25/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LandingGroceriesListViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *tableObj;
}
@property(strong,nonatomic)NSMutableArray *arrObj,*iteamArrObj;
- (IBAction)GroceriesBtnTapp:(id)sender;

@end
