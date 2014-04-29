//
//  ItemView.m
//  EShop
//
//  Created by Rajasekhar on 20/12/12.
//  
//

#import "TileView1.h"

@implementation TileView1
@synthesize title;
@synthesize itemView;
@synthesize button;
@synthesize imageView;
@synthesize colorView;



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //
       [[NSBundle mainBundle] loadNibNamed:@"TileView1" owner:self options:nil];
        [self addSubview:itemView];
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
