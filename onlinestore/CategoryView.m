//
//  ItemView.m
//  EShop
//
//  Created by Rajasekhar on 20/12/12.
//  
//

#import "CategoryView.h"



@implementation CategoryView
@synthesize title,price,discount;
@synthesize itemView;
@synthesize button;
@synthesize imageviewMobile;
@synthesize discountLabel;
@synthesize activityIndicator;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //
       [[NSBundle mainBundle] loadNibNamed:@"CategoryView" owner:self options:nil];
        
        imageView.delegate=self;
        
        self.itemView.layer.masksToBounds = YES;
        self.itemView.layer.cornerRadius =3;
        
        self.itemView.layer.borderWidth=1;
        self.itemView.layer.borderColor=[[UIColor grayColor] CGColor];

        
        [self addSubview:itemView];
        [activityIndicator startAnimating];
        
        
        
    }
    return self;
}

-(void)setDiscountLabelHidden:(BOOL)flag{
    if (flag) {
        [self.discountLabel setHidden:YES];
        [self.discount setHidden:YES];
        [OFF setHidden:YES];
        
    }
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
- (void)drawRect:(CGRect)rect
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
