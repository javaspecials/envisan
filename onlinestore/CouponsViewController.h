//
//  OffersAndDealsViewController.h
//  onlinestore
//
//  Created by Envision on 15/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface CouponsViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{

}
@property (weak, nonatomic) IBOutlet UITableView *couponsTableView;
@end
