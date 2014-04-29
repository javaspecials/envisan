//
//  TwoPartCell.m
//  EShop
//
//  Created by Rajasekhar on 27/12/12.
//  Copyright (c) 2012 Envision. All rights reserved.
//

#import "CartTableViewCell.h"

@implementation CartTableViewCell
@synthesize delegate,title,price,index,activityIndicator;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        imageView.delegate=self;
        [self addSubview:self];
        [activityIndicator startAnimating];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    
    // Configure the view for the selected state
}
-(IBAction)countStepperChange:(id)sender{

    
    NSLog(@"stepper Count %f",[countStepper value]);
    countLabel.text=[NSString stringWithFormat:@"%g",[countStepper value]];
    
    [delegate stepperChanged:countStepper atIndex:index];

}




- (void)setLazyImage:(NSString*)imageURL {
	imageView.imageURL = [NSURL URLWithString:imageURL];
    
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
	[super willMoveToSuperview:newSuperview];
	
	if(!newSuperview) {
		[imageView cancelImageLoad];
	}
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)draw   Rect:(CGRect)rect
 {
 // Drawing code
 }
 */
- (void)imageViewLoadedImage:(EGOImageView*)imageView{
    [activityIndicator stopAnimating];
}
- (void)imageViewFailedToLoadImage:(EGOImageView*)imageView error:(NSError*)error{
    
#warning implement this "image not loaded case" get image from raghu
}


@end
