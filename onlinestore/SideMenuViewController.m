//
//  SideMenuViewController.m
//  onlinestore
//
//  Created by Envision on 5/1/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import "SideMenuViewController.h"
#import "SettingsCell.h"
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"

#import "UserSettingsViewController.h"
#import "SignUpViewController.h"
#import "UserProfileViewController.h"
#import "IIViewDeckController.h"
#import "UserFeedBackViewController.h"

@interface SideMenuViewController ()

@end
NSMutableDictionary *dic;
ASIFormDataRequest *getRequest;
ASIFormDataRequest *updateRequest;
@implementation SideMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     [self setHeaderView:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)preferenceBtnTapp:(id)sender {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    
    UserFeedBackViewController *vc =[sb instantiateViewControllerWithIdentifier:@"UserFeedBackViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}
- (IBAction)settingsBtnTapp:(id)sender {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    
    UserSettingsViewController *vc =[sb instantiateViewControllerWithIdentifier:@"UserSettingsViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)profileBtnTapp:(id)sender {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    
    
    UserProfileViewController *sv =[sb instantiateViewControllerWithIdentifier:@"UserProfileViewController"];
    [self.navigationController pushViewController:sv animated:YES];
    

    
    
}
@end
