//
//  UserPreferenceViewController.h
//  onlinestore
//
//  Created by Envision on 03/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface UserFeedBackViewController : BaseViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate,UITextViewDelegate>
{
   // BOOL checkboxSelected;
     UITableView *table;
    IBOutlet UISegmentedControl *Segment;
    __weak IBOutlet UIButton *apprecationBtn;
    __weak IBOutlet UIButton *complaintBtn;
    __weak IBOutlet UIButton *suggessionBtn;
    NSString *strTem;
}
//- (IBAction)apprecationBtn:(id)sender;
//- (IBAction)complaintBtn:(id)sender;
//- (IBAction)suggessionBtn:(id)sender;



@property (weak, nonatomic) IBOutlet UIScrollView *myScroolView;
@property (weak, nonatomic) IBOutlet UITextField *manufatureTxt;
@property (weak, nonatomic) IBOutlet UITextField *applicationTxt;
@property (weak, nonatomic) IBOutlet UITextField *storeTxt;
@property (weak, nonatomic) IBOutlet UITextField *ratingTxt;
@property (weak, nonatomic) IBOutlet UITextView *complaintTxtView;
- (IBAction)dropdownBtnTapp:(id)sender;


- (IBAction)saveTapp:(id)sender;


- (IBAction)segmentChanged:(id)sender;


- (IBAction)cancelBtnTap:(id)sender;

-(void)geData;
-(void)webServiceCalling;
-(void)getDetails;
-(void)dropDownBtnMethods;

@property(strong,nonatomic)NSMutableArray *arrobj;
@end
