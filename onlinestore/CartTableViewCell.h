//
//  TwoPartCell.h
//  EShop
//
//  Created by Rajasekhar on 27/12/12.
//  Copyright (c) 2012 Envision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGOImageLoader.h"
#import "EGOImageView.h"
#import <QuartzCore/QuartzCore.h>

@class EGOImageView;

@protocol StepperDelegate <NSObject>

-(void)stepperChanged:(UIStepper *)countStepper atIndex:(int)index;

@end

@interface CartTableViewCell : UITableViewCell<EGOImageViewDelegate>{
    
    id<StepperDelegate> delegate;
    
    IBOutlet UILabel *title;
    IBOutlet UILabel *price;
    IBOutlet EGOImageView* imageView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    
    
    
    IBOutlet UILabel *countLabel;
    IBOutlet UIStepper *countStepper;
    
    int index;
}
@property (retain) id delegate;
@property(nonatomic,retain)UILabel *title;
@property(nonatomic,retain)UILabel *price;
@property(assign)int index;

-(IBAction)countStepperChange:(id)sender;

@property (nonatomic,retain) IBOutlet UIActivityIndicatorView *activityIndicator;



- (void)setLazyImage:(NSString*)imageURL;
- (void)imageViewLoadedImage:(EGOImageView*)imageView;
- (void)imageViewFailedToLoadImage:(EGOImageView*)imageView error:(NSError*)error;

@end
