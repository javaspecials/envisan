//
//  BrowsDisplayViewController.h
//  onlinestore
//
//  Created by Envision on 02/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface BrowsDisplayViewController : BaseViewController

@property (weak, nonatomic) IBOutlet UIImageView *myImg;

@property (weak, nonatomic) IBOutlet UIScrollView *myScroolImg;
@property (weak, nonatomic) IBOutlet UILabel *itmIdLbl;
@property (weak, nonatomic) IBOutlet UILabel *skuCodeIdLbl;
@property (weak, nonatomic) IBOutlet UILabel *cpLbl;
@property (weak, nonatomic) IBOutlet UILabel *mrpLbl;
@property (weak, nonatomic) IBOutlet UILabel *spLbl;
@property (weak, nonatomic) IBOutlet UILabel *catgIdLbl;

@property (weak, nonatomic) IBOutlet UILabel *createdDateLbl;
@property (weak, nonatomic) IBOutlet UILabel *createdByLbl;
@property (weak, nonatomic) IBOutlet UILabel *modifiedDateLbl;
@property (weak, nonatomic) IBOutlet UILabel *modifiedByLbl;



@property(strong,nonatomic)NSString *strImg,*strItemId,*strSkuCodeId,*strCp,*strMrp,*strSp,*strCatgId,*strcreateDate,*strCreatedBy,*strmodifiedDate,*sstrmodifiedBy;
@end
