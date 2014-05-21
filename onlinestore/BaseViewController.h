//
//  BaseViewController.h
//  ParamedTab
//
//  Created by Rajasekhar on 16/10/13.
//  Copyright (c) 2013 Envision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
@interface BaseViewController : UIViewController{
    
    BOOL isOpen;
    BOOL isclose;
    //HomeViewController *homeviewcontrollerObj;

}
@property (weak, nonatomic) IBOutlet UILabel *cartCountLabel;
//@property (weak, nonatomic) HomeViewController *cartCountLabel;

-(void)setHeaderView:(BOOL)flag;
-(IBAction)homeClick:(id)sender;
-(IBAction)cartButtonTap:(id)sender;
-(IBAction)sideMenuTap:(id)sender;

-(void)updateCartItems;
//-(void)popupClosed;
@end
