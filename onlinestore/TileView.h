//
//  ItemView.h
//  EShop
//
//  Created by Rajasekhar on 20/12/12.
//  
//

#import <UIKit/UIKit.h>

@interface TileView : UIView{
    IBOutlet UIView *itemView;
    IBOutlet UILabel *title;
    IBOutlet UIButton *button;
    IBOutlet UIImageView *imageView;
    IBOutlet UIView *colorView;

}
@property(nonatomic,retain)UILabel *title;

@property(nonatomic,retain)UIView *itemView;
@property(nonatomic,retain)UIButton *button;
@property(nonatomic,retain)UIImageView *imageView;
@property(nonatomic,retain)UIView *colorView;

@end
