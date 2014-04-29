//
//  BrowsDisplayViewController.m
//  onlinestore
//
//  Created by Envision on 02/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import "BrowsDisplayViewController.h"

@interface BrowsDisplayViewController ()

@end

@implementation BrowsDisplayViewController
//@synthesize strImg,myImg,codeIdLbl,itmIdLbl,nameLbl,promeLbl,bleIdLbl,strCodeId,strcreateDate,sstrmodifiedBy,strCreatedBy,strItemId,strmodifiedDate,strCp,strMrp,strSp,createdByLbl,createdDateLbl,modifiedByLbl,modifiedDateLbl,myScroolImg;
@synthesize myScroolImg,myImg,itmIdLbl,skuCodeIdLbl,cpLbl,mrpLbl,spLbl,catgIdLbl,createdDateLbl,createdByLbl,modifiedByLbl,modifiedDateLbl,strImg,strItemId,strSkuCodeId,strCp,strMrp,strSp,strCatgId,strcreateDate,strCreatedBy,strmodifiedDate,sstrmodifiedBy;
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
    [self setHeaderView:YES];
	// Do any additional setup after loading the view.
    
    
    NSURL *url=[NSURL URLWithString:strImg];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    
    UIImage *tmpImage = [[UIImage alloc] initWithData:data];
    myImg.image = tmpImage;
    
    itmIdLbl.text =[NSString stringWithFormat:@"%@", strItemId];
    skuCodeIdLbl.text = [NSString stringWithFormat:@"%@", strSkuCodeId];
    //nameLbl.text = strName;
    cpLbl.text = [NSString stringWithFormat:@"%@", strCp];
    mrpLbl.text = [NSString stringWithFormat:@"%@", strMrp];
    spLbl.text = [NSString stringWithFormat:@"%@", strSp];
    catgIdLbl.text = [NSString stringWithFormat:@"%@", strCatgId];
   // bleIdLbl.text= [NSString stringWithFormat:@"%@", strBleId];
    createdDateLbl.text = [NSString stringWithFormat:@"%@", strcreateDate];
    createdByLbl.text = [NSString stringWithFormat:@"%@", strCreatedBy];
    modifiedDateLbl.text = [NSString stringWithFormat:@"%@", strmodifiedDate];
    modifiedByLbl.text = [NSString stringWithFormat:@"%@", sstrmodifiedBy];
    
    
    [myScroolImg setScrollEnabled:YES];
    [myScroolImg setContentSize:CGSizeMake(320, 1500)];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
