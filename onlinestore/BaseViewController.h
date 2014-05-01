//
//  BaseViewController.h
//  ParamedTab
//
//  Created by Rajasekhar on 16/10/13.
//  Copyright (c) 2013 Envision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController{
}
@property (weak, nonatomic) IBOutlet UILabel *cartCountLabel;


-(void)setHeaderView:(BOOL)flag;
-(IBAction)homeClick:(id)sender;
-(IBAction)cartButtonTap:(id)sender;
-(IBAction)sideMenuTap:(id)sender;

-(void)updateCartItems;
//-(void)popupClosed;
@end
