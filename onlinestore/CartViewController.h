//
//  CartViewController.h
//  onlinestore
//
//  Created by Envision on 10/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "CartTableViewCell.h"

@interface CartViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,StepperDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

-(IBAction)cancelClick:(id)sender;

@end