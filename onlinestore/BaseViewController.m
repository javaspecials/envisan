//
//  BaseViewController.m
//  ParamedTab
//
//  Created by Rajasekhar on 16/10/13.
//  Copyright (c) 2013 Envision. All rights reserved.
//

#import "BaseViewController.h"
#import "DataHandler.h"
#import "CartViewController.h"
#import "IIViewDeckController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

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
    // Do any additional setup after loading the view from its nib.
}
-(void)viewDidAppear:(BOOL)animated{

    [self updateCartItems];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
-(void)setHeaderView:(BOOL)flag{

    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"BaseViewController" owner:self options:nil];
    UIView *view= (UIView *)[array objectAtIndex:0];
    [self.view addSubview:view];
    [self  updateCartItems];
}
-(IBAction)homeClick:(id)sender{

    [self.navigationController popViewControllerAnimated:YES];
    
    NSLog(@"HEllo");
    
}

-(void)updateCartItems{

    _cartCountLabel.text=[NSString stringWithFormat:@"%i",[[[DataHandler defaultHandler] cartItems] count]];
}

-(IBAction)sideMenuTap:(id)sender{
 
    [self.viewDeckController openLeftViewAnimated:YES];


}

-(IBAction)cartButtonTap:(id)sender{

    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    CartViewController *vc = [sb instantiateViewControllerWithIdentifier:@"CartViewController"];
    
    [self presentViewController:vc animated:YES completion:nil];
    
    
    //[self.navigationController pushViewController:vc animated:YES];

}


@end
