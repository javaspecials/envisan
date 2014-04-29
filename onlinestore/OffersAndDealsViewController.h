//
//  OffersAndDealsViewController.h
//  onlinestore
//
//  Created by Envision on 16/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface OffersAndDealsViewController : BaseViewController<UITableViewDataSource>{
}
@property (weak, nonatomic) IBOutlet UITableView *couponsTableView;

@end
