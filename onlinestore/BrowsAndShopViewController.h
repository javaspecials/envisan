//
//  BrowsAndShopViewController.h
//  onlinestore
//
//  Created by Envision on 02/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface BrowsAndShopViewController : BaseViewController
<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate,UISearchDisplayDelegate>
{
    IBOutlet UITableView *tableViewObj;
}
@property (weak, nonatomic) IBOutlet UISearchBar *searchBarObj;
@property(strong,nonatomic)NSMutableArray *searchReasultObj,*arrTitle,*imgArry,*iteamIdArr,*bleIdArr,*nameArry,*shortDecArray,*iteamPromoMsgArr,*cpArr,*mrpArr,*spArr,*itemUrlArr,*codeIdArr,*promoMsgArr,*createdDateArry,*createdByArr,*modifiedDateArr,*modifiedByArr,*decArr,*cateIdArr,*skuCodeArr;

-(void)getDetails;


@end
