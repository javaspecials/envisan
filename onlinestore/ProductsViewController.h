//
//  ProductsViewController.h
//  onlinestore
//
//  Created by Envision on 24/03/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface ProductsViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{

    IBOutlet UITextField *productName;
    IBOutlet UITableView *tableViewObj;

}
-(IBAction)searchProducts;
@property(strong,nonatomic)NSArray *nameArrObj,*skuArrObj,*imageArrObj,*decArrObj, *productArrObj;

@end
