//
//  WishList2ViewController.h
//  onlinestore
//
//  Created by Envision on 23/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface WishListViewController : UIViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
{
     UITableView *table;
}


@property (weak, nonatomic) IBOutlet UIScrollView *myScroolObj;
- (IBAction)browseBtnTapp:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *productNameTxf;
@property (weak, nonatomic) IBOutlet UITextField *frequencyTxf;
@property (weak, nonatomic) IBOutlet UITextField *storeTxf;
@property (weak, nonatomic) IBOutlet UITextField *quantityTxf;
@property (weak, nonatomic) IBOutlet UITextField *brandTxf;
@property (weak, nonatomic) IBOutlet UITextField *modelTxf;
- (IBAction)saveBtnTapp:(id)sender;
- (IBAction)cancelBtnTapp:(id)sender;
- (IBAction)dropDownbtnTapp:(id)sender;
@property(strong,nonatomic)NSArray *arrObj;
@end
