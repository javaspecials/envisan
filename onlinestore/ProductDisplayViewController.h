//
//  ProductDisplayViewController.h
//  onlinestore
//
//  Created by Envision on 02/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "TableCell.h"
@interface ProductDisplayViewController : BaseViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
{
     //IBOutlet TableCell  *ccell;
    IBOutlet UITableView *table;

}
@property (weak, nonatomic) IBOutlet UILabel *ratingLbl;

@property(strong,nonatomic)NSString *desStr,*skuStrObj,*imgStr;

@property(strong,nonatomic)NSArray *titleArObj,*commntsArObj,*ratingArObj,*resDic,*productArrObj ;

@property (weak, nonatomic) IBOutlet UIImageView *imgObj;
@property (weak, nonatomic) IBOutlet UITextView *desTextObj;
@property (weak, nonatomic) IBOutlet UITextView *comentTextObj;
@property (strong, nonatomic) IBOutlet UIScrollView *scrolObj;
@end


