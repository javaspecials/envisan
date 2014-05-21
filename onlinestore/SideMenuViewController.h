//
//  SideMenuViewController.h
//  onlinestore
//
//  Created by Envision on 5/1/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsCell.h"
#import "BaseViewController.h"

@interface SideMenuViewController : BaseViewController
@property(strong,nonatomic)IBOutlet SettingsCell *scell;
- (IBAction)settingsBtnTapp:(id)sender;
- (IBAction)preferenceBtnTapp:(id)sender;
- (IBAction)profileBtnTapp:(id)sender;

@end
