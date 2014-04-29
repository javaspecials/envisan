//
//  ItemView.h
//  EShop
//
//  Created by Rajasekhar on 20/12/12.
//  
//

#import <UIKit/UIKit.h>
#import "EGOImageLoader.h"
#import "EGOImageView.h"
#import <QuartzCore/QuartzCore.h>

@class EGOImageView;


@interface CategoryView : UIView <EGOImageViewDelegate>{
    
 IBOutlet EGOImageView* imageView;
    
    IBOutlet UIView *itemView;
    IBOutlet UILabel *title;
    IBOutlet UILabel *price;
    IBOutlet UILabel *discount;
    IBOutlet UILabel *OFF;
    IBOutlet UIButton *button;
    
    IBOutlet UIView *view;
    
    IBOutlet UIImageView *imageviewMobile;
    IBOutlet UIImageView *discountLabel;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    
}
@property(nonatomic,retain)UILabel *title;
@property(nonatomic,retain)UILabel *price;
@property(nonatomic,retain)UILabel *discount;
@property(nonatomic,retain)UIView *itemView;
@property(nonatomic,retain)UIButton *button;

@property (nonatomic,retain) IBOutlet UIImageView *imageviewMobile;
@property (nonatomic,retain) IBOutlet UIImageView *discountLabel;
@property (nonatomic,retain) IBOutlet UIActivityIndicatorView *activityIndicator;


-(void)setDiscountLabelHidden:(BOOL)flag;

- (void)setLazyImage:(NSString*)imageURL;
- (void)imageViewLoadedImage:(EGOImageView*)imageView;
- (void)imageViewFailedToLoadImage:(EGOImageView*)imageView error:(NSError*)error;

@end
