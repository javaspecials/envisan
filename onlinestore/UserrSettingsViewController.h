//
//  UserrSettingsViewController.h
//  onlinestore
//
//  Created by Envision on 03/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface UserrSettingsViewController : BaseViewController
{
    //IBOutlet UISwitch *mySwitch;
    UILabel *lblObj;
    
}

@property (weak, nonatomic) IBOutlet UIScrollView *myScrool;

@property (weak, nonatomic) IBOutlet UISwitch *pushSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *smsBSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *emailSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *screenlockBSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *bannerSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *bluetoothSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *webserverSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *wifiSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *gpsSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *sslSwitch;

-(void)SubmitDetails;
- (IBAction)saveTab:(id)sender;

@property(strong,nonatomic)NSArray *pushArr,*smsArr,*emailArr,*screenLockArr,*bannerArr,*bleutoothArr,*webserverArr,*wifiArr,*gpsArr,*sslArr;
@property(strong,nonatomic)NSString *pushStr,*smsStr,*emailStr,*screenLockStr,*bannerStr,*bluetoothStr,*webserverStr,*wifiStr,*gpsStr,*sslStr;
@end
