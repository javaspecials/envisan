//
//  PriceCompareDisplayViewController.h
//  onlinestore
//
//  Created by Envision on 02/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface PriceCompareDisplayViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIScrollView *myScrool;

@property(strong,nonatomic)NSString *desStr,*skuStr,*imgStr;
@property (weak, nonatomic) IBOutlet UILabel *salePrice;

@property(strong,nonatomic)NSArray *titleArObj,*commntsArObj,*ratingArObj,*resDic ;
@property (weak, nonatomic) IBOutlet UIImageView *priceImg;

@property (weak, nonatomic) IBOutlet UILabel *priceLbl;


@end
