//
//  ItemDetailViewController.m
//  onlinestore
//
//  Created by Rajasekhar on 18/02/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "DataHandler.h"

@interface ItemDetailViewController ()

@end

@implementation ItemDetailViewController
@synthesize  itemDetailDictionary;

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
    [self setHeaderView:YES];
	// Do any additional setup after loading the view.
    NSLog(@"DETAIL :%@",itemDetailDictionary);
    [imageView setImage:[UIImage imageWithData: [NSData dataWithContentsOfURL: [NSURL URLWithString:[NSString stringWithFormat:@"%@",[itemDetailDictionary objectForKey:@"imageURL"]]]]]];
    
    itemTitle.text=[itemDetailDictionary objectForKey:@"name"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Button Action Methods
-(IBAction)backClick:(id)sender{

    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)addToCartTap:(id)sender{

    [[[DataHandler defaultHandler] cartItems] addObject:itemDetailDictionary];
    [self updateCartItems];
    

}
- (IBAction)reportBtn:(id)sender {
//    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Please Contact to Store Manager" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
   // CAAnimation *ani = CAMediaTimingFunction functionWithControlPoints;
//    
//    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Title" message:@"Saved Successfully" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    
    [alert show];
    
    //[self buttonAction];
    //[self showAlert];
}


@end
