//
//  ShopViewController.h
//  onlinestore
//
//  Created by Envision on 24/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface ShopViewController : BaseViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
{
     UITableView *table;
}

@property (weak, nonatomic) IBOutlet UIScrollView *myScroolObj;
//- (IBAction)browseBtn:(id)sender;
- (IBAction)browseBtnTapp:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *productNameTxf;
@property (weak, nonatomic) IBOutlet UITextField *frequencyTxf;
@property (weak, nonatomic) IBOutlet UITextField *storeTxf;
@property (weak, nonatomic) IBOutlet UITextField *quantityTxf;
@property (weak, nonatomic) IBOutlet UITextField *brandTxf;
@property (weak, nonatomic) IBOutlet UITextField *modelTxf;
- (IBAction)cancelBtnTapp:(id)sender;
- (IBAction)saveBtnTapp:(id)sender;
- (IBAction)dropDownBtnTapp:(id)sender;
@property(strong,nonatomic)NSArray *arrObj;
@end
