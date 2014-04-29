//
//  RegisterViewController.h
//  onlinestore
//
//  Created by Envision on 15/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatePickerView.h"
#import "BaseViewController.h"
#import <QuartzCore/QuartzCore.h>
//#import "BaseViewController.h"


@interface RegisterViewController : BaseViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>

{
      UITableView *table;
    DatePickerView* picker;
    IBOutlet UILabel *lblDate;
}
@property (weak, nonatomic) IBOutlet UITextField *userNameTxf;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxf;
@property (weak, nonatomic) IBOutlet UITextView *addressTxtView;
- (IBAction)cityBtnTapp:(id)sender;

- (IBAction)stateBtnTapp:(id)sender;

- (IBAction)datePickerBtnTapp:(id)sender;
- (IBAction)countryBtnTapp:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *fNameTxf;
@property (weak, nonatomic) IBOutlet UITextField *lNameTxf;
@property (weak, nonatomic) IBOutlet UITextField *cityNameTxf;
@property (weak, nonatomic) IBOutlet UITextField *dobTxf;
@property (weak, nonatomic) IBOutlet UITextField *stateNameTxf;
@property (weak, nonatomic) IBOutlet UITextField *countryNameTxf;
@property (weak, nonatomic) IBOutlet UITextField *emailAddrTxf;
- (IBAction)saveBtnTapp:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *myScrObj;
@property(strong,nonatomic)NSArray *cityArr,*stateArr,*countryArr;
@end
