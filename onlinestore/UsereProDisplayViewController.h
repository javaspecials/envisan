//
//  UsereProDisplayViewController.h
//  onlinestore
//
//  Created by Envision on 03/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface UsereProDisplayViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIScrollView *myScroolView;
@property (weak, nonatomic) IBOutlet UIImageView *mostPerchedImg;
@property (weak, nonatomic) IBOutlet UIImageView *mostSearchedImg;
@property (weak, nonatomic) IBOutlet UILabel *freqVisistedStoreLbl;
@property (weak, nonatomic) IBOutlet UILabel *intrestedBrand;

@property(strong,nonatomic)NSArray *mostPerchesedArr,*freqVstStoredArr,*intrestedBrandArr;
@end
