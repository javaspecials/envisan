//
//  SideMenuViewController.h
//  onlinestore
//
//  Created by Envision on 5/1/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsCell.h"

@interface SideMenuViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
     IBOutlet UITableView *tableObj;
   IBOutlet SettingsCell *scell;
}
@property(strong,nonatomic)IBOutlet SettingsCell *scell;
- (IBAction)settingsBtnTapp:(id)sender;
@property (strong,nonatomic)NSArray *arrObj,*ntfObj,*totalObj;
@property(strong,nonatomic)NSArray *pushArr,*smsArr,*emailArr,*screenLockArr,*bannerArr,*bleutoothArr,*webserverArr,*wifiArr,*gpsArr,*sslArr;
@property(strong,nonatomic)NSString *pushStr,*smsStr,*emailStr,*screenLockStr,*bannerStr,*bluetoothStr,*webserverStr,*wifiStr,*gpsStr,*sslStr;
@end
