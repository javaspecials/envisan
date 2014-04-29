//
//  CartViewController.m
//  onlinestore
//
//  Created by Envision on 10/04/14.
//  Copyright (c) 2014 Rajasekhar. All rights reserved.
//

#import "CartViewController.h"
#import "DataHandler.h"

@interface CartViewController ()

@end

@implementation CartViewController

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
#pragma mark Button Action Methods

-(IBAction)cancelClick:(id)sender{

    [self dismissViewControllerAnimated:YES completion:nil];

}

#pragma mark TableViewDatasource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //  return 3;
    return   [[[DataHandler defaultHandler] cartItems] count];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CartTableViewCell *cell;
    //  static NSString *CellIdentifier = @"CustomCell";
	//cell = (TwoPartCell *)[tableView dequeueReusableCellWithIdentifier:@"TwoPartCell"];
    
	//if (cell == nil) {
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"CartTableViewCell" owner:self options:nil];
    cell = (CartTableViewCell *)[array objectAtIndex:0];
    [cell setDelegate:self];
	//}
    
    
    NSMutableDictionary *itemDetailDic=[[[DataHandler defaultHandler] cartItems] objectAtIndex:indexPath.section];
    
    
    cell.title.text=[itemDetailDic objectForKey:@"name"];
	cell.price.text=[[itemDetailDic objectForKey:@"mrp"] stringValue];
    cell.index=indexPath.section;
   
    EGOImageView *imageIconView=[[EGOImageView alloc] initWithPlaceholderImage:[UIImage imageNamed:@"icon72x72.png"]];
     imageIconView.imageURL = [NSURL URLWithString:[itemDetailDic objectForKey:@"imageURL"]];
     imageIconView.frame=CGRectMake(0, 0, 83, 94);
     [cell addSubview:imageIconView];
    return cell;
    
    
}

//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 106;
//    
//}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return -20;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 106;
}
#pragma mark TableViewDelegate Methods


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        if ( [[[DataHandler defaultHandler] cartItems] count])
        {
            
            [[[DataHandler defaultHandler] cartItems] removeObjectAtIndex:indexPath.section];
            
            [_myTableView reloadData];
            [self updateCartItems];
        }
        
    }
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (  [[[DataHandler defaultHandler] cartItems] count])
    {
        return YES;
    }
    return NO;
}


#pragma mark StepperDelegate Methods
-(void)stepperChanged:(UIStepper *)countStepper atIndex:(int)index{
    
    NSLog(@"value is  at %f index %i",[countStepper value],index);
    
}


@end
