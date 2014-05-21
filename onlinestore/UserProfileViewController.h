//
//  UserProfileViewController.h
//  onlinestore
//
//  Created by Envision on 03/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "DatePickerView.h"

@interface UserProfileViewController : BaseViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UITextField *greeting;
      UITableView *table;
      DatePickerView* picker;
   //IBOutlet  UIDatePicker *picker;
    

}
//@property (weak, nonatomic) IBOutlet UIScrollView *myScroolView;
//- (IBAction)displayDateBtnTapp:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *outerCircle;

@property(strong,nonatomic)UIDatePicker *picker;

@property (weak, nonatomic) IBOutlet UIScrollView *scrObj;
@property (weak, nonatomic) IBOutlet UITextField *useNameTxf;
@property (weak, nonatomic) IBOutlet UITextField *pwdTxt;
@property (weak, nonatomic) IBOutlet UITextField *fNameTxt;
@property (weak, nonatomic) IBOutlet UITextField *lNameTxt;
@property (weak, nonatomic) IBOutlet UITextField *userAliasTxt;
@property (weak, nonatomic) IBOutlet UITextField *dobTxt;
@property (weak, nonatomic) IBOutlet UITextView *address1Txt;
@property (weak, nonatomic) IBOutlet UITextView *address2Txf;

@property (weak, nonatomic) IBOutlet UITextField *cityNameTxt;
@property (weak, nonatomic) IBOutlet UITextField *stateNameTxt;
@property (weak, nonatomic) IBOutlet UITextField *countryNameTxf;
@property (weak, nonatomic) IBOutlet UITextField *emaitAdrTxf;
@property (weak, nonatomic) IBOutlet UITextField *zipCodeTxf;
@property (weak, nonatomic) IBOutlet UITextField *languageTxf;

- (IBAction)submitBtnTapp:(id)sender;
- (IBAction)datePickerBtnTapp:(id)sender;
@property(strong,nonatomic)NSArray *lanArrObj;
-(void)webserViceCalling;
-(void)textfieldValidation;



@end
