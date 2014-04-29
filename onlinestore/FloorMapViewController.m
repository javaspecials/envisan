//
//  FloorMapViewController.m
//  onlinestore
//
//  Created by Rajasekhar on 18/02/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import "FloorMapViewController.h"

@interface FloorMapViewController ()

@end

@implementation FloorMapViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)backClick:(id)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
