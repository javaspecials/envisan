//
//  NearByMallsViewController.h
//  OneStopShop
//
//  Created by Rajasekhar
//  Copyright (c) 2014 Envision All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDLocationsMapViewController.h"
#import "BaseViewController.h"

@interface SignUpViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,PDLocationsMapDataSource, PDLocationsMapDelegate>{
    
    IBOutlet UITableView *tableViewNearByMalls;

}
- (IBAction)selectMallTap:(id)sender;

@end
