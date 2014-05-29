//
//  ViewController.m
//  SampleTiles
//
//  Created by Rajasekhar on 19/03/14.
//
//

#import "HomeViewController1.h"

#import "TileView1.h"
#import "CategoriesViewController.h"
#import "ProductsViewController.h"
#import "BuildingMapViewController.h"
#import "PriceAndCompareViewController.h"
#import "BrowsAndShopViewController.h"
#import "UserSettingsViewController.h"
#import "UserProfileViewController.h"
#import "UserFeedBackViewController.h"
#import "UsereProDisplayViewController.h"
#import "CategoriesViewController.h"
#import "OffersAndDealsViewController.h"
#import "CouponsViewController.h"
#import "LandingShopListViewController.h"
#import "UserProductSelectionListViewController.h"
@interface HomeViewController1 ()

@end

@implementation HomeViewController1

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setHeaderView:YES];
    
    NSMutableArray *iconsLeft=[[NSMutableArray alloc] init];
    
    
    NSMutableDictionary *tempLeftDic1=[[NSMutableDictionary alloc] init];
    [tempLeftDic1 setObject:@"1" forKey:@"id"];
    [tempLeftDic1 setObject:@"Offers & Deals" forKey:@"name"];
    [tempLeftDic1 setObject:@"175" forKey:@"height"];
    [tempLeftDic1 setObject:@"#FF7419" forKey:@"color"];
    [tempLeftDic1 setObject:@"e.png" forKey:@"image"];

    [iconsLeft addObject:tempLeftDic1];
    
    NSMutableDictionary *tempLeftDic2=[[NSMutableDictionary alloc] init];
    [tempLeftDic2 setObject:@"2" forKey:@"id"];
    [tempLeftDic2 setObject:@"Map & Mall" forKey:@"name"];
    [tempLeftDic2 setObject:@"125" forKey:@"height"];
    [tempLeftDic2 setObject:@"#1996E6" forKey:@"color"];
     [tempLeftDic2 setObject:@"d.png" forKey:@"image"];
    [iconsLeft addObject:tempLeftDic2];
    
    NSMutableDictionary *tempLeftDic3=[[NSMutableDictionary alloc] init];
    [tempLeftDic3 setObject:@"3" forKey:@"id"];
    [tempLeftDic3 setObject:@"Coupons" forKey:@"name"];
    [tempLeftDic3 setObject:@"150" forKey:@"height"];
    [tempLeftDic3 setObject:@"#C1392B" forKey:@"color"];
    [tempLeftDic3 setObject:@"b.png" forKey:@"image"];
    [iconsLeft addObject:tempLeftDic3];
    
    NSMutableDictionary *tempLeftDic4=[[NSMutableDictionary alloc] init];
    [tempLeftDic4 setObject:@"4" forKey:@"id"];
    [tempLeftDic4 setObject:@"Compare Price" forKey:@"name"];
    [tempLeftDic4 setObject:@"150" forKey:@"height"];
    [tempLeftDic4 setObject:@"#FF7419" forKey:@"color"];
    [tempLeftDic4 setObject:@"c.png" forKey:@"image"];

    [iconsLeft addObject:tempLeftDic4];
    
    NSMutableDictionary *tempLeftDic5=[[NSMutableDictionary alloc] init];
    [tempLeftDic5 setObject:@"5" forKey:@"id"];
    [tempLeftDic5 setObject:@"User Settings" forKey:@"name"];
    [tempLeftDic5 setObject:@"150" forKey:@"height"];
    [tempLeftDic5 setObject:@"#1996E6" forKey:@"color"];
    [tempLeftDic5 setObject:@"j.png" forKey:@"image"];
    [iconsLeft addObject:tempLeftDic5];
    
    
    NSMutableDictionary *tempLeftDic6=[[NSMutableDictionary alloc] init];
    [tempLeftDic6 setObject:@"6" forKey:@"id"];
    [tempLeftDic6 setObject:@"Wish List" forKey:@"name"];
    [tempLeftDic6 setObject:@"150" forKey:@"height"];
    [tempLeftDic6 setObject:@"#FF7419" forKey:@"color"];
    [tempLeftDic6 setObject:@"j.png" forKey:@"image"];
    [iconsLeft addObject:tempLeftDic6];

    
      [iconsLeft addObject:tempLeftDic6];
    
  
    
    NSMutableArray *iconsRight=[[NSMutableArray alloc] init];
    
    
    NSMutableDictionary *tempRightDic1=[[NSMutableDictionary alloc] init];
    [tempRightDic1 setObject:@"7" forKey:@"id"];
    [tempRightDic1 setObject:@"Browse & Shop" forKey:@"name"];
    [tempRightDic1 setObject:@"150" forKey:@"height"];
    [tempRightDic1 setObject:@"#F8BD19" forKey:@"color"];
    [tempRightDic1 setObject:@"g.png" forKey:@"image"];
    [iconsRight addObject:tempRightDic1];
    
    NSMutableDictionary *tempRightDic2=[[NSMutableDictionary alloc] init];
    [tempRightDic2 setObject:@"8" forKey:@"id"];
    [tempRightDic2 setObject:@"Review Products" forKey:@"name"];
    [tempRightDic2 setObject:@"150" forKey:@"height"];
    [tempRightDic2 setObject:@"#86B91C" forKey:@"color"];
     [tempRightDic2 setObject:@"a.png" forKey:@"image"];
    [iconsRight addObject:tempRightDic2];
    
    NSMutableDictionary *tempRightDic3=[[NSMutableDictionary alloc] init];
    [tempRightDic3 setObject:@"9" forKey:@"id"];
    [tempRightDic3 setObject:@"Shop Assistant" forKey:@"name"];
    [tempRightDic3 setObject:@"150" forKey:@"height"];
    [tempRightDic3 setObject:@"#7658F8" forKey:@"color"];
    [tempRightDic3 setObject:@"f.png" forKey:@"image"];

    [iconsRight addObject:tempRightDic3];
    
    NSMutableDictionary *tempRightDic4=[[NSMutableDictionary alloc] init];
    [tempRightDic4 setObject:@"10" forKey:@"id"];
    [tempRightDic4 setObject:@"User Feedback" forKey:@"name"];
    [tempRightDic4 setObject:@"150" forKey:@"height"];
    [tempRightDic4 setObject:@"#F8BD19" forKey:@"color"];
    [iconsRight addObject:tempRightDic4];
    
    NSMutableDictionary *tempRightDic5=[[NSMutableDictionary alloc] init];
    [tempRightDic5 setObject:@"11" forKey:@"id"];
    [tempRightDic5 setObject:@"User Profile" forKey:@"name"];
    [tempRightDic5 setObject:@"150" forKey:@"height"];
    [tempRightDic5 setObject:@"#86B91C" forKey:@"color"];
     [tempRightDic5 setObject:@"k.png" forKey:@"image"];
    [iconsRight addObject:tempRightDic5];
    
    NSMutableDictionary *tempRightDic6=[[NSMutableDictionary alloc] init];
    [tempRightDic6 setObject:@"12" forKey:@"id"];
    [tempRightDic6 setObject:@"" forKey:@"name"];
    [tempRightDic6 setObject:@"150" forKey:@"height"];
    [tempRightDic6 setObject:@"#F8BD19" forKey:@"color"];
    [tempRightDic6 setObject:@"k.png" forKey:@"image"];
    [iconsRight addObject:tempRightDic6];
    
    NSMutableDictionary *tempRightDic7=[[NSMutableDictionary alloc] init];
    [tempRightDic7 setObject:@"12" forKey:@"id"];
    [tempRightDic7 setObject:@"" forKey:@"name"];
    [tempRightDic7 setObject:@"150" forKey:@"height"];
    [tempRightDic7 setObject:@"#F8BD19" forKey:@"color"];
    [tempRightDic7 setObject:@"k.png" forKey:@"image"];
    [iconsRight addObject:tempRightDic7];

    
    
    for (UIView *v in [tilesScrollView subviews]) {
        [v removeFromSuperview];
    }
    UIView *tempView=[self getScrollingContentView:iconsLeft:iconsRight];
    [tilesScrollView addSubview:tempView];
    tilesScrollView.contentSize =CGSizeMake(tempView.frame.size.width, tempView.frame.size.height);

    
}

-(UIView *)getScrollingContentView:(NSArray *)leftcontents:(NSArray*)rightContents{
    
   
    int x_position=0;
    int y_position=0;
    
    UIView *tempView=[[UIView alloc] init];
    TileView1 *tileView;
    
    
    for (int i=0; i<=1; i++) {
    
     y_position=0;
        
        for (int j=0;j<[leftcontents count];j++) {
          
          NSDictionary *contentsDic;
          
          if (i==0) {
              contentsDic=[leftcontents objectAtIndex:j];

          }else{
              contentsDic=[rightContents objectAtIndex:j];
          }
          
            
            tileView=[[TileView1 alloc]init];
            tileView.itemView.frame=CGRectMake(x_position,y_position,tileView.itemView.frame.size.width,[[contentsDic objectForKey:@"height"] intValue]);
            tileView.colorView.backgroundColor=[self colorFromHexString:[contentsDic objectForKey:@"color"]];
            tileView.title.text=[NSString stringWithFormat:@"%@",[contentsDic objectForKey:@"name"]];
            tileView.button.tag=[[contentsDic objectForKey:@"id"] intValue];
           
             [tileView.button addTarget:self action:@selector(categoryClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [tileView.imageView setImage:[UIImage imageNamed:[contentsDic objectForKey:@"image"]]];
            
            [tempView addSubview:tileView.itemView];
           
            y_position=y_position+tileView.itemView.frame.size.height;
           
        }
      
         x_position=x_position+tileView.itemView.frame.size.width;
        
    }
    
    tempView.frame=CGRectMake(0, 0, x_position,y_position );
    return tempView;
}

-(UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}


-(void)categoryClick:(id)sender{
    
    UIButton *button=sender;
    
    int index=button.tag;
    NSLog(@"%d",index);
    
    
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    
    
    switch (index) {
            //        case 1:{
            //            CategoriesViewController *vc =[sb instantiateViewControllerWithIdentifier:@"CategoriesViewController"];
            //            [self.navigationController pushViewController:vc animated:YES];
            //            }
            //            break;
            //        case 2:{
            //            BuildingMapViewController *vc =[sb instantiateViewControllerWithIdentifier:@"BuildingMapViewController"];
            //            [self.navigationController pushViewController:vc animated:YES];
            //        }
            //            break;
            
        case 1:{
            OffersAndDealsViewController *vc =[sb instantiateViewControllerWithIdentifier:@"OffersAndDealsViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 2:{
            CategoriesViewController *vc =[sb instantiateViewControllerWithIdentifier:@"CategoriesViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 3:{
            CouponsViewController *vc =[sb instantiateViewControllerWithIdentifier:@"CouponsViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 4:{
            PriceAndCompareViewController *vc =[sb instantiateViewControllerWithIdentifier:@"PriceAndCompareViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
            
        case 5:{
            UserSettingsViewController *vc =[sb instantiateViewControllerWithIdentifier:@"UserSettingsViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 6:{
            UserProductSelectionListViewController *vc =[sb instantiateViewControllerWithIdentifier:@"UserProductSelectionListViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 7:{
            BrowsAndShopViewController *vc =[sb instantiateViewControllerWithIdentifier:@"BrowsAndShopViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 8:{
            ProductsViewController *vc =[sb instantiateViewControllerWithIdentifier:@"ProductsViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        
        
        case 10:{
            UserFeedBackViewController *vc =[sb instantiateViewControllerWithIdentifier:@"UserPreferenceViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        case 11:{
            UserProfileViewController *vc =[sb instantiateViewControllerWithIdentifier:@"UserProfileViewController"];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
//        case 12:{
//            UserrSettingsViewController *vc =[sb instantiateViewControllerWithIdentifier:@"UserrSettingsViewController"];
//            [self.navigationController pushViewController:vc animated:YES];
//        }
//            break;
            
            
            
            
//        case 10:{
//            UserProfileViewController *vc =[sb instantiateViewControllerWithIdentifier:@"UserProfileViewController"];
//            [self.navigationController pushViewController:vc animated:YES];
//        }
//            break;
            
            
            
        default:{
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Comming Soon.." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
            break;
    }
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
