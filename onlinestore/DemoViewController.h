//
//  DemoViewController.h
//  onlinestore
//
//  Created by Envision on 05/05/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoViewController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UILabel *name;
    IBOutlet UILabel *gender;
    IBOutlet UILabel *zipCode;
    IBOutlet UILabel *age;
    IBOutlet UILabel *emailid;
    IBOutlet UIButton *submitButton;
    IBOutlet UITextField *nametext;
    IBOutlet UISegmentedControl *gendertext;
    IBOutlet UITextField *zipCodetext;
    IBOutlet UITextField *agetext;
    IBOutlet UITextField *emailidtext;
    
    
}
@property(nonatomic,retain) IBOutlet UIButton *submitButton;
-(IBAction)submitButtonClicked:(id)sender;

@end
