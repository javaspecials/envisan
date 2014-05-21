//
//  SignUpViewController1.h
//  onlinestore
//
//  Created by Envision on 05/05/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DatePickerView.h"
#import "BaseViewController.h"

@interface SignUpViewController : BaseViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
{
     UITableView *table;
       DatePickerView* picker;
    IBOutlet UISegmentedControl *Segment;
}
@property(strong,nonatomic)UIDatePicker *picker;
@property (weak, nonatomic) IBOutlet UITextField *nameTxf;
@property (weak, nonatomic) IBOutlet UITextField *mfTxf;
@property (weak, nonatomic) IBOutlet UITextField *emailTxf;
@property (weak, nonatomic) IBOutlet UITextField *zipTxf;
@property (weak, nonatomic) IBOutlet UITextField *dobTxf;
@property (weak, nonatomic) IBOutlet UILabel *lbl;

- (IBAction)saveBtnTapp:(id)sender;
- (IBAction)dateTapp:(id)sender;
- (IBAction)segment:(id)sender;
- (IBAction)MfBtnTapp:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *myScroolObj;
@property(strong,nonatomic) NSArray *arrObj;
@end
