//
//  ViewController.h
//  onlinestore
//
//  Created by Rajasekhar on 2/18/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface CategoriesViewController : BaseViewController<UIScrollViewDelegate>{
    
    IBOutlet UIScrollView *categoriesScrollView;
    IBOutlet UIScrollView *promotionalItemsScrollView;
    IBOutlet UIScrollView *itemsScrollView;
    
    
    
    NSMutableArray *categories;
    NSMutableArray *items;
    NSMutableArray *promotionalItems;
}
-(IBAction)backClick:(id)sender;


@end
