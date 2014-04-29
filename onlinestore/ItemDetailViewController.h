//
//  ItemDetailViewController.h
//  onlinestore
//
//  Created by Rajasekhar on 18/02/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface ItemDetailViewController : BaseViewController{

    NSDictionary *itemDetailDictionary;
    IBOutlet UIImageView *imageView;
    IBOutlet UILabel *itemTitle;
}
-(IBAction)backClick:(id)sender;
-(IBAction)addToCartTap:(id)sender;

@property(nonatomic,retain)  NSDictionary *itemDetailDictionary;
- (IBAction)reportBtn:(id)sender;

@end
