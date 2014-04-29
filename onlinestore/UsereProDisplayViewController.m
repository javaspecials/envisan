//
//  UsereProDisplayViewController.m
//  onlinestore
//
//  Created by Envision on 03/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import "UsereProDisplayViewController.h"
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"
@interface UsereProDisplayViewController ()

@end

@implementation UsereProDisplayViewController
@synthesize myScroolView,mostPerchedImg,mostPerchesedArr,freqVisistedStoreLbl,freqVstStoredArr,intrestedBrand;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setHeaderView:YES];
   // self.navigationController.navigationBarHidden = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
    [myScroolView setScrollEnabled:YES];
    [myScroolView setContentSize:CGSizeMake(320, 1000)];
    
 

}


-(NSData *)dataWithLocalFileContents:(NSString*)fileLocation{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileLocation stringByDeletingPathExtension] ofType:[fileLocation pathExtension]];
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    return data;
}


-(void)displayLable
{
    self.freqVisistedStoreLbl.text = [NSString stringWithFormat:@"%@",freqVstStoredArr];
    
     self.intrestedBrand.text = [NSString stringWithFormat:@"%@",intrestedBrand];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
