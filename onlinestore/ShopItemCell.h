//
//  TwoPartCell.h
//  Created by Rajasekhar
//

#import <UIKit/UIKit.h>


@interface ShopItemCell : UITableViewCell{
    
    IBOutlet UILabel *title;
    IBOutlet UILabel *subTitle;
    IBOutlet UILabel *price;
    
}

@property(nonatomic,retain)UILabel *title;
@property(nonatomic,retain)UILabel *subTitle;
@property(nonatomic,retain)UILabel *price;



@end
