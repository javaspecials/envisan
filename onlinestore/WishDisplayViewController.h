//
//  WishDisplayViewController.h
//  onlinestore
//
//  Created by Envision on 23/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "AppDelegate.h"

@interface WishDisplayViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,UISearchDisplayDelegate>
{
    IBOutlet  UITableView *tableObj;
    AppDelegate *appDelegate;

}
//- (IBAction)productNameTxfBt:(id)sender;
@property (weak, nonatomic) IBOutlet UISearchBar *searchDisplay;
@property(nonatomic,retain) NSMutableArray  *arrWish,*totArObj;

@property(strong,nonatomic)NSMutableArray *searchReasultObj,*arrTitle,*imgArry,*iteamIdArr,*bleIdArr,*nameArry,*shortDecArray,*iteamPromoMsgArr,*cpArr,*mrpArr,*spArr,*itemUrlArr,*codeIdArr,*promoMsgArr,*createdDateArry,*createdByArr,*modifiedDateArr,*modifiedByArr,*decArr,*cateIdArr,*skuCodeArr,*totaArrObj;
-(void)postDataService;
@end
