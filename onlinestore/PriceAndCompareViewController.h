//
//  PriceAndCompareViewController.h
//  onlinestore
//
//  Created by Envision on 02/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface PriceAndCompareViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    
    IBOutlet UITableView *tableViewOj;
}
@property (weak, nonatomic) IBOutlet UITextField *productNameTxt;
- (IBAction)searchBtnTapp:(id)sender;
@property(strong,nonatomic)NSArray *nameArrObj,*skuArrObj,*imageArrObj,*decArrObj,*productArrObj;
@property (weak, nonatomic) IBOutlet UIScrollView *myScroolView;


@end
