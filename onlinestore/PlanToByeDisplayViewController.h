//
//  PlanToByeDisplayViewController.h
//  onlinestore
//
//  Created by Envision on 03/05/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlanToByeDisplayViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchDisplayDelegate>
{
    //IBOutlet  UITableView *tableObj;
    IBOutlet UITableView *tableObj;
   // AppDelegate *appDelegate;
    
}
//- (IBAction)productNameTxfBt:(id)sender;
@property (weak, nonatomic) IBOutlet UISearchBar *searchDisplay;
@property(nonatomic,retain) NSMutableArray  *arrWish,*totArObj;

@property(strong,nonatomic)NSMutableArray *searchReasultObj,*arrTitle,*imgArry,*iteamIdArr,*bleIdArr,*nameArry,*shortDecArray,*iteamPromoMsgArr,*cpArr,*mrpArr,*spArr,*itemUrlArr,*codeIdArr,*promoMsgArr,*createdDateArry,*createdByArr,*modifiedDateArr,*modifiedByArr,*decArr,*cateIdArr,*skuCodeArr,*totaArrObj;
-(void)postDataService;

@end
